$#Right::window.move('R')
$#Left::window.move('L')
$#Up::window.move('U')
$#Down::window.move('D')

$^#Right::window.resize('R')
$^#Left::window.resize('L')
$^#Up::window.resize('U')
$^#Down::window.resize('D')

$#WheelUp::window.unit_update(1)
$#WheelDown::window.unit_update(-1)
$#MButton::window.unit_reset()

class window {
    static DEFAULT_UNITS := 50
    static UNITS_INCREMENT_INTERVAL := 10
    static current_units := this.DEFAULT_UNITS

    static unit_update(sign) {
        local last_units := this.current_units
        local increment := this.UNITS_INCREMENT_INTERVAL * sign
        local new := this.current_units + increment
        this.current_units := Max(0, new)
        if (last_units != this.current_units) {
            this.notify()
        }
    }
    
    static unit_reset() {
        this.current_units := this.DEFAULT_UNITS
        this.notify()
    }

    static move(direction) => this.re_mo('move', direction)
    static resize(direction) => this.re_mo('resize', direction)

    static re_mo(type, direction) {
        direction := SubStr(direction, 1, 1)
        id := 'ahk_id ' WinActive('A')
        WinGetPos(&x, &y, &w, &h, id)
        if (type = 'resize')
            switch direction {
                case 'R': w += this.current_units
                case 'L': w -= this.current_units
                case 'U': h -= this.current_units
                case 'D': h += this.current_units
            }
        else if (type = 'move')
            switch direction {
                case 'R': x += this.current_units
                case 'L': x -= this.current_units
                case 'U': y -= this.current_units
                case 'D': y += this.current_units
            }
        WinMove(x, y, w, h, id)
    }

    static notify() =>
        ToolTip('unit increment set to: ' this.current_units) 
        . SetTimer((*) => ToolTip(), -1000)
}