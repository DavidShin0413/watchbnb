import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const widget = document.getElementById("widget");

  if (widget) {

    const unavailableDates = JSON.parse(widget.dataset.unavailable)

    flatpickr(".datepicker", {
      disable: unavailableDates,
      minDate: "today"
    });
  }
}

export { initFlatpickr };
