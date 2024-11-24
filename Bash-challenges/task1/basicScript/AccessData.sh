#Bash Data Access Script

#!/bin/bas
# Function to display script usage
show_usage() {
    echo "Usage: $0 [options] filename"
    echo "Options:"
    echo "  -r    Read file content"
    echo "  -s    Search for a pattern"
    echo "  -c    Count lines/words/characters"
    echo "  -f    Filter specific columns (for CSV)"
    echo "  -h    Show this help message"
}

# Function to read file content
read_file() {
    local file=$1
    if [[ -f "$file" ]]; then
        echo "=== File Content ==="
        cat "$file"
    else
        echo "Error: File '$file' not found!"
        exit 1
    fi
}

# Function to search pattern in file
search_pattern() {
    local file=$1
    local pattern=$2
    if [[ -f "$file" ]]; then
        echo "=== Searching for '$pattern' ==="
        grep -n "$pattern" "$file"
        echo "=== Search Results Count ==="
        grep -c "$pattern" "$file"
    else
        echo "Error: File '$file' not found!"
        exit 1
    fi
}

# Function to count lines, words, and characters
count_stats() {
    local file=$1
    if [[ -f "$file" ]]; then
        echo "=== File Statistics ==="
        echo "Lines: $(wc -l < "$file")"
        echo "Words: $(wc -w < "$file")"
        echo "Characters: $(wc -m < "$file")"
    else
        echo "Error: File '$file' not found!"
        exit 1
    fi
}

# Function to filter CSV columns
filter_csv() {
    local file=$1
    local columns=$2
    if [[ -f "$file" ]]; then
        echo "=== Filtered CSV Data ==="
        cut -d',' -f"$columns" "$file"
    else
        echo "Error: File '$file' not found!"
        exit 1
    fi
}

# Main script
if [[ $# -eq 0 ]]; then
    show_usage
    exit 1
fi

# Process command line options
while getopts "hrs:c:f:" opt; do
    case $opt in
        h)
            show_usage
            exit 0
            ;;
        r)
            operation="read"
            ;;
        s)
            operation="search"
            pattern="$OPTARG"
            ;;
        c)
            operation="count"
            ;;
        f)
            operation="filter"
            columns="$OPTARG"
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            show_usage
            exit 1
            ;;
    esac
done

# Get filename from remaining arguments
shift $((OPTIND-1))
filename=$1

# Execute requested operation
case $operation in
    "read")
        read_file "$filename"
        ;;
    "search")
        search_pattern "$filename" "$pattern"
        ;;
    "count")
        count_stats "$filename"
        ;;
    "filter")
        filter_csv "$filename" "$columns"
        ;;
    *)
        show_usage
        exit 1
        ;;
esac