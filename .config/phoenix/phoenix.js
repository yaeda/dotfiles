const WIDTH_LIST_SIDE = [1 / 3, 1 / 6, 2 / 6, 3 / 6, 4 / 6];
const WIDTH_LIST_CENTER = [1 / 3, 1 / 2];

Phoenix.set({
  daemon: false,
  openAtLogin: true,
});

class PrefixKey {
  constructor(key, modifiers) {
    this.modal = new Modal();
    this.modal.text = "Layout Control Mode";

    this.suffixes = [];
    this.storageKeys = [];

    this.pendingDeactivationHandler = null;

    this.active = false;
    Key.on(key, modifiers, () => {
      if (this.active) {
        this.deactivate();
      } else {
        this.activate();
      }
    });
  }

  showModal() {
    var screen_frame = Screen.main().frameInRectangle();
    var result_frame = this.modal.frame();
    this.modal.origin = {
      x: 0.5 * (screen_frame.width - result_frame.width),
      y: 0.5 * (screen_frame.height - result_frame.height),
    };
    this.modal.show();
  }

  activate() {
    if (this.pendingDeactivationHandler !== null) {
      Timer.off(this.pendingDeactivationHandler);
    }
    this.active = true;
    this.suffixes.forEach((suffix) => {
      suffix.enable();
    });
    this.showModal();

    this.pendingDeactivationHandler = Timer.after(1, () => {
      this.deactivate();
    });
  }

  deactivate() {
    this.active = false;
    // Disable suffix
    this.suffixes.forEach((suffix) => {
      suffix.disable();
    });
    this.modal.close();

    // clear counter
    this.storageKeys.forEach((storageKey) => {
      Storage.set(storageKey, 0);
    });
  }

  addSuffix(key, modifiers, callback) {
    const storageKey = [key, ...modifiers.sort()].join(":");
    this.storageKeys.push(storageKey);
    Storage.set(storageKey, 0);

    const suffix = new Key(key, modifiers, () => {
      if (this.pendingDeactivationHandler !== null) {
        Timer.off(this.pendingDeactivationHandler);
      }

      const count = Storage.get(storageKey);
      callback(count);
      Storage.set(storageKey, count + 1);

      this.pendingDeactivationHandler = Timer.after(1, () => {
        this.deactivate();
      });
    });
    suffix.disable();
    this.suffixes.push(suffix);
  }
}

const prefix = new PrefixKey("d", ["cmd"]);

prefix.addSuffix("a", ["cmd"], (count) => {
  const screen = Screen.main().flippedVisibleFrame();
  const window = Window.focused();

  if (window) {
    window.setFrame({
      x: 0,
      y: 0,
      width: screen.width,
      height: screen.height,
    });
  }
});

prefix.addSuffix("b", ["cmd"], (count) => {
  const screen = Screen.main().flippedVisibleFrame();
  const window = Window.focused();

  if (window) {
    window.setFrame({
      x: 0,
      y: 0,
      width: screen.width * WIDTH_LIST_SIDE[count % WIDTH_LIST_SIDE.length],
      height: screen.height,
    });
  }
});

prefix.addSuffix("l", ["cmd"], (count) => {
  const screen = Screen.main().flippedVisibleFrame();
  const window = Window.focused();

  if (window) {
    const width =
      screen.width * WIDTH_LIST_CENTER[count % WIDTH_LIST_CENTER.length];

    window.setFrame({
      x: (screen.width - width) / 2,
      y: 0,
      width: width,
      height: screen.height,
    });
  }
});

prefix.addSuffix("f", ["cmd"], (count) => {
  const screen = Screen.main().flippedVisibleFrame();
  const window = Window.focused();

  if (window) {
    const width =
      screen.width * WIDTH_LIST_SIDE[count % WIDTH_LIST_SIDE.length];

    window.setFrame({
      x: screen.width - width,
      y: 0,
      width: width,
      height: screen.height,
    });
  }
});

prefix.addSuffix("b", ["cmd", "ctrl"], (count) => {
  const screen = Screen.main().flippedVisibleFrame();
  const window = Window.focused();

  if (window) {
    const reverseIndex =
      WIDTH_LIST_SIDE.length - (count % WIDTH_LIST_SIDE.length) - 1;
    const width = screen.width * WIDTH_LIST_SIDE[reverseIndex];

    window.setFrame({
      x: 0,
      y: 0,
      width: width,
      height: screen.height,
    });
  }
});

prefix.addSuffix("l", ["cmd", "ctrl"], (count) => {
  const screen = Screen.main().flippedVisibleFrame();
  const window = Window.focused();

  if (window) {
    const reverseIndex =
      WIDTH_LIST_CENTER.length - (count % WIDTH_LIST_CENTER.length) - 1;
    const width = screen.width * WIDTH_LIST_CENTER[reverseIndex];

    window.setFrame({
      x: (screen.width - width) / 2,
      y: 0,
      width: width,
      height: screen.height,
    });
  }
});

prefix.addSuffix("f", ["cmd", "ctrl"], (count) => {
  const screen = Screen.main().flippedVisibleFrame();
  const window = Window.focused();

  if (window) {
    const reverseIndex =
      WIDTH_LIST_SIDE.length - (count % WIDTH_LIST_SIDE.length) - 1;
    const width = screen.width * WIDTH_LIST_SIDE[reverseIndex];

    window.setFrame({
      x: screen.width - width,
      y: 0,
      width: width,
      height: screen.height,
    });
  }
});

prefix.addSuffix("l", [], () => {
  const APP_ID_TODO = "com.microsoft.to-do-mac";
  const APP_ID_SLACK = "com.tinyspeck.slackmacgap";
  const APP_ID_CHROME = "com.google.Chrome.canary";
  const APP_ID_TARGETS = [APP_ID_TODO, APP_ID_SLACK, APP_ID_CHROME];
  const TARGET_FRAMES = {
    [APP_ID_TODO]: {
      x: 0.04,
      y: 0.125,
      width: 0.2,
      height: 0.75,
    },
    [APP_ID_CHROME]: {
      x: 0.25,
      y: 0.125,
      width: 0.35,
      height: 0.75,
    },
    [APP_ID_SLACK]: {
      x: 0.61,
      y: 0.125,
      width: 0.35,
      height: 0.75,
    },
  };

  const screen = Screen.main().flippedVisibleFrame();
  const windows = Screen.main().windows();
  if (windows) {
    const targetWindows = [];
    windows.forEach((window) => {
      const id = window.app().bundleIdentifier();
      if (window.isVisible() && APP_ID_TARGETS.includes(id)) {
        targetWindows.push({ id: id, window: window });
      }
    });

    targetWindows.forEach((target) => {
      const frame = TARGET_FRAMES[target.id];
      target.window.setFrame({
        x: screen.width * frame.x,
        y: screen.height * frame.y,
        width: screen.width * frame.width,
        height: screen.height * frame.height,
      });
    });
  }
});

Phoenix.notify("Phoenix config loaded");
