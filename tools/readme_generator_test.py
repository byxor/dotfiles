import unittest
import textwrap
from generate_readme import *


MAKEFILES = [ \
"""
VARIABLE := 1000

compile:
# This is a
# sample docstring
	do x
	do y
	do z
        do "not a target:"

clean:
# delete junk files
	foo
	bar

__sync:
	whatever
""", \
"""
.PHONY: foo bar baz

foo: x y
# do foo stuff:

bar: a b
# do bar stuff:

baz: 1 2
# do baz stuff:
""", \
"""
cat:
# doc_cat

catt:
# doc_catt

cattt :
# doc_cattt
"""
]

class MakefileInteractionTest(unittest.TestCase):

    def test_target_scraper(self):
        def test_names():
            data = [
                (MAKEFILES[0], ['compile', 'clean']),
                (MAKEFILES[1], ['foo', 'bar', 'baz']),
                (MAKEFILES[2], ['cat', 'catt', 'cattt']),
            ]
            for makefile, expected_target_names in data:
                target_names = map(lambda target: target.name, scrape_targets_from(makefile))
                self.assertEqual(expected_target_names, target_names)

        def test_line_numbers():
            data = [
                (MAKEFILES[0], [3, 11]),
                (MAKEFILES[1], [3, 6, 9]),
                (MAKEFILES[2], [1, 4, 7]),
            ]
            for makefile, expected_line_numbers in data:
                line_numbers = map(lambda target: target.line_number, scrape_targets_from(makefile))
                self.assertEqual(expected_line_numbers, line_numbers)
                
        test_names()
        test_line_numbers()

    def test_docstring_fetcher(self):
        data = [
            (MAKEFILES[0], 'compile', 'This is a\nsample docstring'),
            (MAKEFILES[0], 'clean', 'delete junk files'),
            (MAKEFILES[1], 'foo', 'do foo stuff:'),
            (MAKEFILES[1], 'bar', 'do bar stuff:'),
            (MAKEFILES[1], 'baz', 'do baz stuff:'),
            (MAKEFILES[2], 'cat', 'doc_cat'),
            (MAKEFILES[2], 'catt', 'doc_catt'),
            (MAKEFILES[2], 'cattt', 'doc_cattt'),
        ]
        for makefile, target_name, expected_docstring in data:
            target = [target for target in scrape_targets_from(makefile) if target.name == target_name][0]
            docstring = fetch_docstring_for(makefile, target)
            self.assertEqual(expected_docstring, docstring)

    def test_partial_documentation_generation(self):
        data = [
            (MAKEFILES[0], \
             """\
             # Makefile targets

             ## compile

             This is a
             sample docstring

             ## clean

             delete junk files
             """),
            (MAKEFILES[1], \
             """\
             # Makefile targets

             ## foo

             do foo stuff:

             ## bar

             do bar stuff:

             ## baz

             do baz stuff:
             """),
            (MAKEFILES[2], \
             """\
             # Makefile targets

             ## cat

             doc_cat

             ## catt

             doc_catt

             ## cattt

             doc_cattt
             """)
        ]
        for makefile, expected_documentation in data:
            documentation = generate_documentation_for(makefile)
            expected_documentation = textwrap.dedent(expected_documentation)
            self.assertEqual(expected_documentation, documentation)
        

if __name__ == '__main__':
    unittest.main()
