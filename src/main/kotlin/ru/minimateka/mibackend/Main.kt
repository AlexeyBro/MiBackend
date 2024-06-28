package ru.minimateka.mibackend

import io.ktor.server.application.*
import io.ktor.server.engine.*
import io.ktor.server.netty.*
import io.ktor.server.plugins.defaultheaders.*
import io.ktor.server.response.*
import io.ktor.server.routing.*

fun main() {
    embeddedServer(
        Netty,
        port = 8082,
        host = "0.0.0.0",
        module = Application::module
    ).start(wait = true)
}

fun Application.module() {
    configureHTTP()
    configureRouting()
}

fun Application.configureHTTP() {
    install(DefaultHeaders) {
        header("Header-Name", "Ktor")
    }
}

fun Application.configureRouting() {
    routing {
        get("/") {
            call.respondText("Завелось)")
        }
    }
}
