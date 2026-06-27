mod core;

fn main() {
    let args: Vec<String> = std::env::args().collect();
    if args.len() < 2 {
        println!("Prototype CLI");
        println!("Usage: prototype <name>");
        return;
    }

    let name = &args[1];
    let result = core::validate_name(name);
    if !result.success {
        println!("Error: {}", result.message);
        std::process::exit(1);
    }

    println!("OK: name '{}' is valid", name);
}
