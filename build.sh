# Delete macOS garbage
rm -f ./mediaimport-2/.DS_Store

# Check if there are any unstaged / uncommitted changes
if [[ $(git status -s ./mediaimport-2) ]]; then
    # Print error message and exit
    echo "ERROR: There are unstaged / uncommitted changes in the build directory."
    exit 1
fi


# Copy the license to the build folder
cp ./LICENSE ./mediaimport-2/LICENSE

# Delete previous build
rm -f ./media_import_VERSION.ankiaddon

# Create the Anki plugin
cd ./mediaimport-2
zip -r ../media_import_VERSION.ankiaddon *
cd ..

# Delete the license from the build folder
rm ./mediaimport-2/LICENSE

echo "\nSuccessfully built 'media_import_VERSION.ankiaddon'"
