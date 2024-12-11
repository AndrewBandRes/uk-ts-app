const DESKTOP_BREAKPOINT = 1200
const TABLET_BREAKPOINT = 768
const MOBILE_BREAKPOINT = 320

function debounce(func, wait) {
  let timeout;
  return function(...args) {
    const context = this;
    clearTimeout(timeout);
    timeout = setTimeout(() => {
      func.apply(context, args);
    }, wait);
  };
}
