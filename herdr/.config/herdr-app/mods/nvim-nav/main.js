// ctrl+h/j/k/l: nvim이 포커스된 터미널이면 키를 nvim에 넘기고, 아니면 pane을 이동한다.
// nvim은 시작할 때 ~/.cache/herdr-app/nvim/<터미널 id>에 서버 주소를 남긴다(nvim/.config/nvim/lua/herdr_app.lua).
// nvim 쪽에서 split 가장자리에 닿으면 `herdr-app do pane.go`로 pane을 넘긴다.
import { View, div } from "gpui-kit";
import { focused, run, hc, home, readTextFile, nextCommand, checking } from "herdr";

const KEY = { left: "ctrl+h", down: "ctrl+j", up: "ctrl+k", right: "ctrl+l" };

export default class NvimNav extends View {
  init(_props, cx) {
    if (checking()) return;
    cx.spawn(async (cx) => {
      for (;;) {
        const direction = await nextCommand();
        try {
          await this.go(direction);
        } catch (e) {
          console.log(`nvim-nav: ${direction} failed: ${e}`);
        }
      }
    });
  }

  async go(direction) {
    const key = KEY[direction];
    if (!key) return;
    const terminal = focused()?.terminal;
    if (terminal && (await readTextFile(`${home()}/.cache/herdr-app/nvim/${terminal}`))) {
      await hc(["keys", terminal, key]);
    } else {
      run("pane.go", { direction });
    }
  }

  render() {
    return div().size(0);
  }
}
