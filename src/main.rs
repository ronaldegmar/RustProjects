#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use] extern crate rocket;

use rocket::http::RawStr;

#[get("/<name>")]
fn index(name: &RawStr) -> String {
    format!("Testing, {}!", name.as_str())
}

fn main() {
    rocket::ignite().mount("/", routes![index]).launch();
}
