#import "Compiler";
#import "File";
#import "File_Utilities";
#import "Sort";
#import "Basic";

#run {
    set_build_options_dc(.{do_output = false});

    test_files := quick_sort(file_list("tests", recursive=true), compare_strings);

    for file: test_files {
        w := compiler_create_workspace(file);
        options := get_build_options(w);
        options.output_type = .NO_OUTPUT;
        set_build_options(options, w);
        add_build_file(file, w);
        print("% tests: OK\n", file);
    }
}
