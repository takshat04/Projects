import tkinter as tk
from tkinter import ttk

# Function to create and handle the weight conversion window
def weight_converter():
    weight_window = tk.Toplevel(root)
    weight_window.title('Weight Converter')

    # Widgets for weight converter
    label_value = ttk.Label(weight_window, text='Enter Weight:')
    label_value.grid(row=0, column=0, padx=10, pady=10)

    entry_value = ttk.Entry(weight_window)
    entry_value.grid(row=0, column=1, padx=10, pady=10)

    label_from = ttk.Label(weight_window, text='From Unit:')
    label_from.grid(row=1, column=0, padx=10, pady=10)

    combo_from = ttk.Combobox(weight_window, values=['Kilograms', 'Pounds'])
    combo_from.grid(row=1, column=1, padx=10, pady=10)

    label_to = ttk.Label(weight_window, text='To Unit:')
    label_to.grid(row=2, column=0, padx=10, pady=10)

    combo_to = ttk.Combobox(weight_window, values=['Kilograms', 'Pounds'])
    combo_to.grid(row=2, column=1, padx=10, pady=10)

    # Button to initiate the conversion
    button_convert = ttk.Button(weight_window, text='Convert', command=lambda: convert_weight(entry_value, combo_from, combo_to, label_result))
    button_convert.grid(row=3, column=0, columnspan=2, pady=10)

    # Label to display the result
    label_result = ttk.Label(weight_window, text='Result: ')
    label_result.grid(row=4, column=0, columnspan=2, pady=10)

# Function to create and handle the temperature conversion window
def temperature_converter():
    temperature_window = tk.Toplevel(root)
    temperature_window.title('Temperature Converter')

    # Widgets for temperature converter
    label_value = ttk.Label(temperature_window, text='Enter Temperature:')
    label_value.grid(row=0, column=0, padx=10, pady=10)

    entry_value = ttk.Entry(temperature_window)
    entry_value.grid(row=0, column=1, padx=10, pady=10)

    label_from = ttk.Label(temperature_window, text='From Unit:')
    label_from.grid(row=1, column=0, padx=10, pady=10)

    combo_from = ttk.Combobox(temperature_window, values=['Celsius', 'Fahrenheit', 'Kelvin'])
    combo_from.grid(row=1, column=1, padx=10, pady=10)

    label_to = ttk.Label(temperature_window, text='To Unit:')
    label_to.grid(row=2, column=0, padx=10, pady=10)

    combo_to = ttk.Combobox(temperature_window, values=['Celsius', 'Fahrenheit', 'Kelvin'])
    combo_to.grid(row=2, column=1, padx=10, pady=10)

    # Button to initiate the conversion
    button_convert = ttk.Button(temperature_window, text='Convert', command=lambda: convert_temperature(entry_value, combo_from, combo_to, label_result))
    button_convert.grid(row=3, column=0, columnspan=2, pady=10)

    # Label to display the result
    label_result = ttk.Label(temperature_window, text='Result: ')
    label_result.grid(row=4, column=0, columnspan=2, pady=10)

# Function to create and handle the length conversion window
def length_converter():
    length_window = tk.Toplevel(root)
    length_window.title('Length Converter')

    # Widgets for length converter
    label_value = ttk.Label(length_window, text='Enter Length:')
    label_value.grid(row=0, column=0, padx=10, pady=10)

    entry_value_length = ttk.Entry(length_window)
    entry_value_length.grid(row=0, column=1, padx=10, pady=10)

    label_from = ttk.Label(length_window, text='From Unit:')
    label_from.grid(row=1, column=0, padx=10, pady=10)

    # Removed 'Feet' from length options
    combo_from_length = ttk.Combobox(length_window, values=['Kilometers', 'Miles'])
    combo_from_length.grid(row=1, column=1, padx=10, pady=10)

    label_to = ttk.Label(length_window, text='To Unit:')
    label_to.grid(row=2, column=0, padx=10, pady=10)

    # Removed 'Feet' from length options
    combo_to_length = ttk.Combobox(length_window, values=['Kilometers', 'Miles'])
    combo_to_length.grid(row=2, column=1, padx=10, pady=10)

    # Button to initiate the conversion
    button_convert = ttk.Button(length_window, text='Convert', command=lambda: convert_length(entry_value_length, combo_from_length, combo_to_length, label_result_length))
    button_convert.grid(row=3, column=0, columnspan=2, pady=10)

    # Label to display the result
    label_result_length = ttk.Label(length_window, text='Result: ')
    label_result_length.grid(row=4, column=0, columnspan=2, pady=10)

# Function to convert weight units
def convert_weight(entry, combo_from, combo_to, label_result):
    try:
        value = float(entry.get())
        from_unit = combo_from.get()
        to_unit = combo_to.get()

        # Conversion factors for weight
        conversion_factors = {
            'Kilograms to Pounds': 2.20462,
            'Pounds to Kilograms': 0.453592,
        }

        # Perform the conversion
        result = value * conversion_factors[f'{from_unit} to {to_unit}']

        # Update the result label
        label_result.config(text=f'Result: {result:.2f} {to_unit}')

    except ValueError:
        label_result.config(text='Invalid input. Please enter a number.')

# Function to convert temperature units
def convert_temperature(entry, combo_from, combo_to, label_result):
    try:
        value = float(entry.get())
        from_unit = combo_from.get()
        to_unit = combo_to.get()

        # Conversion factors for temperature
        conversion_factors = {
            'Celsius to Fahrenheit': lambda x: (x * 9/5) + 32,
            'Fahrenheit to Celsius': lambda x: (x - 32) * 5/9,
            'Celsius to Kelvin': lambda x: x + 273.15,
            'Kelvin to Celsius': lambda x: x - 273.15,
            'Fahrenheit to Kelvin': lambda x: (x + 459.67) * 5/9,
            'Kelvin to Fahrenheit': lambda x: (x * 9/5) - 459.67,
        }

        # Perform the conversion
        result = conversion_factors[f'{from_unit} to {to_unit}'](value)

        # Update the result label
        label_result.config(text=f'Result: {result:.2f} {to_unit}')

    except ValueError:
        label_result.config(text='Invalid input. Please enter a number.')

# Function to convert length units
def convert_length(entry, combo_from, combo_to, label_result_length):
    try:
        value = float(entry.get())
        from_unit = combo_from.get()
        to_unit = combo_to.get()

        # Conversion factors for length
        conversion_factors = {
            'Kilometers to Miles': 0.621371,
            'Miles to Kilometers': 1.60934,
        }

        # Perform the conversion
        result = value * conversion_factors[f'{from_unit} to {to_unit}']

        # Update the result label
        label_result_length.config(text=f'Result: {result:.2f} {to_unit}')

    except ValueError:
        label_result_length.config(text='Invalid input. Please enter a number.')

# Create the main window
root = tk.Tk()
root.title('Unit Converter')

# Widgets for the main window
label_category = ttk.Label(root, text='Choose a Category:')
label_category.pack(pady=10)

button_weight = ttk.Button(root, text='Weight', command=weight_converter)
button_weight.pack(pady=10)

button_temperature = ttk.Button(root, text='Temperature', command=temperature_converter)
button_temperature.pack(pady=10)

button_length = ttk.Button(root, text='Length', command=length_converter)
button_length.pack(pady=10)

# Run the main loop
root.mainloop()
