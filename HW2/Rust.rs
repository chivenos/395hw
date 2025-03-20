use std::io;

fn main() {
    loop {
        println!("x + y veya çıkış için 'exit' yazın:");
        let mut input = String::new();
        io::stdin().read_line(&mut input).unwrap();
        let input = input.trim();

        if input == "exit" {
            break;
        }

        let tokens: Vec<&str> = input.split_whitespace().collect();
        if tokens.len() != 3 {
            println!("Hata!");
            continue;
        }

        let left: f64 = match tokens[0].parse() {
            Ok(num) => num,
            Err(_) => {
                println!("Hata!");
                continue;
            }
        };

        let right: f64 = match tokens[2].parse() {
            Ok(num) => num,
            Err(_) => {
                println!("Hata!");
                continue;
            }
        };

        let result = match tokens[1] {
            "+" => Some(left + right),
            "-" => Some(left - right),
            "*" => Some(left * right),
            "/" => if right == 0.0 {
                println!("0'a bölünemez!");
                None
            } else {
                Some(left / right)
            },
            _ => {
                println!("Hata!");
                None
            }
        };

        if let Some(res) = result {
            println!("{}", res);
        }
    }
}
