function section {
    awk "FNR>=$2 && FNR<=$3" $1
}
