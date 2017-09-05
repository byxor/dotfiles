from collections import namedtuple


Line = namedtuple('Line', 'number contents')
Target = namedtuple('Target', 'line_number name')


TARGET_SPECIFIER = ':'
NEWLINE = '\n'
COMMENT = '#'
HEADER = '#'
PRIVATE = '__'
PHONY = '.PHONY'
ASSIGNMENT = ':='
TARGET_TEMPLATE = '{{target}}'


def generate_documentation_for(makefile):
    targets = scrape_targets_from(makefile)
    documentation = _paragraph(_header(1, "Makefile targets"))
    documentation += ''.join([_target_documentation(makefile, target) for target in targets])
    return documentation.strip() + _line()


def scrape_targets_from(makefile):
    raw_lines =              makefile.split(NEWLINE)
    lines =                  [Line(*temp) for temp in zip(range(len(raw_lines)), raw_lines)]
    colon_lines =            [line for line in lines if TARGET_SPECIFIER in line.contents]
    non_comment_lines =      [line for line in colon_lines if line.contents.strip()[0] != COMMENT]
    non_variable_lines =     [line for line in non_comment_lines if ASSIGNMENT not in line.contents]
    potential_target_lines = [Line(line.number, line.contents.split(':')[0]) for line in non_variable_lines]
    potential_target_lines = [line for line in potential_target_lines if not line.contents.startswith(PHONY)]
    target_lines =           [line for line in potential_target_lines if not line.contents.startswith(' ')]
    targets =                [Target(line.number, line.contents.strip()) for line in target_lines]
    public_targets =         [target for target in targets if not target.name.startswith(PRIVATE)]
    return public_targets


def _paragraph(text):
    return _line(_line(text))


def _line(text=""):
    return text + NEWLINE


def _header(amount, text):
    return (HEADER * amount) + " " + text


def _target_documentation(makefile, target):
    docstring = fetch_docstring_for(makefile, target)
    documentation = _paragraph(_header(2, target.name))
    documentation += _paragraph(docstring)
    return documentation


def fetch_docstring_for(makefile, target):
    raw_lines = makefile.split(NEWLINE)
    start = target.line_number + 1
    end = _get_comment_end_index(raw_lines, start)
    docstring_lines = [line[2:] for line in raw_lines[start:end]]
    templated_docstring_lines = [line.replace(TARGET_TEMPLATE, target.name) for line in docstring_lines]
    return NEWLINE.join(templated_docstring_lines)
    

def _get_comment_end_index(raw_lines, start_index):

    def _in_bounds(i): return i < len(raw_lines)
    def _is_comment(raw_line): return raw_line.startswith(COMMENT)

    for i in range(start_index, len(raw_lines)):
        if _in_bounds(i) and _is_comment(raw_lines[i]):
            i += 1
        else:
            return i


def _get_static_content():
    STATIC_README_PATH = 'tools/STATIC_README_CONTENT.md'
    return _read_file(STATIC_README_PATH)


def _get_makefile():
    MAKEFILE_PATH = 'Makefile'
    return _read_file(MAKEFILE_PATH)


def _read_file(path):
    with open(path, 'r') as file_:
        return file_.read()


def _write_readme(contents):
    README_PATH = 'README.md'
    with open(README_PATH, 'w') as file_:
        file_.write(contents)
    
        
def main():
    print('Generating README...')
    makefile = _get_makefile()
    static_content = _get_static_content()
    dynamic_content = generate_documentation_for(makefile)
    _write_readme(static_content + NEWLINE + dynamic_content)


if __name__ == '__main__':
    main()

