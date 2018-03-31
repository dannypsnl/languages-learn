import nimx.window
import nimx.text_field

proc startApp() =
    var wind = newWindow(newRect(40, 40, 800, 600))

    let label = newLabel(newRect(20, 20, 150, 20))
    label.text = "Hello, Nimx"
    wind.addSubview(label)

runApplication:
    startApp()
