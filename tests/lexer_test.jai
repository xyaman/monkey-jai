#import "Basic";
#import "Compiler";
#load "../src/module.jai";

#run {
    input := "=+(){},;";

    tests := Token.[
        .{ literal = "=", type = .ASSIGN }
    ];

    lexer := new_lexer(input);
    for tests {
        token := lexer_next_token(*lexer);
        if token.type != it.type {
            print("Expected: %, Got: %\n", it.type, token.type);
            compiler_report("Test failed\n");
        }
    }
}
