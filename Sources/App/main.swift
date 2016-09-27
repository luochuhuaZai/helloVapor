import Vapor

let drop = Droplet()

drop.get("/hellojson") { request in
    return try JSON(node: [
        "version": "1.0",
        "hello":"World!"
    ])
}

drop.get { req in
    let lang = req.headers["Accept-Language"]?.string ?? "en"
    
    return try drop.view.make("welcome", [
    	"message": Node.string(drop.localization[lang, "welcome", "title"])
    ])
}

drop.resource("posts", PostController())

drop.run()
