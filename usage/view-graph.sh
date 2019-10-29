# View DOT File

DOT_FILE=$1;
OUTPUT_FILE=$2.svg;

# Create graph Svg File
dot $DOT_FILE -Tsvg -o $OUTPUT_FILE;

# View svg
# In image view or browser
