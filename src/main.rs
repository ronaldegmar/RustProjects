#![feature(proc_macro_hygiene, decl_macro)]

#[macro_use] extern crate rocket;

#[get("/")]
fn index() -> &'static str {
    "Just a little bit more"
}

fn main() {
    rocket::ignite().mount("/", routes![index]).launch();
}
