#import "Compiler";
#import "File";

OUTPUT_PATH :: "bin";
ENTRY_FILE :: "src/main.jai";

#run {
    set_build_options_dc(.{do_output = false});
    make_directory_if_it_does_not_exist(OUTPUT_PATH);

    w := compiler_create_workspace("monkey");

    options := get_build_options(w);
    options.output_executable_name = "monkey";
    options.output_path = OUTPUT_PATH;

    set_build_options(options, w);
    add_build_file(ENTRY_FILE, w);
}
