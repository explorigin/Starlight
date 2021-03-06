package hello_world;

import js.Browser;

import starlight.view.Component;
import starlight.view.Renderer;
import starlight.view.macro.ElementBuilder.e;

class ViewModel extends Component {
    var title = "Starlight • Hello World";
    var clickCount = 0;

    function handleClick() {
        clickCount++;
    }

    override function template() {
        return [
            e('header.title', [if (clickCount > 0) '$title - clicked $clickCount times.' else title]),
            e('section', [
                e('button', {onclick: handleClick}, 'Click Me!')
            ])
        ];
    }
}

class App {
    static function main() {
        var r = new Renderer([{
            component: new ViewModel(),
            root: Browser.document.body
        }]);
        r.start();
    }
}
