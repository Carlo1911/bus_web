from admin_auto_filters.filters import AutocompleteFilter


class BusStopFilter(AutocompleteFilter):
    title = 'Parada/Terminal'
    field_name = 'bus_stop'


class StartBusStopFilter(AutocompleteFilter):
    title = 'Parada/Terminal inicial'
    field_name = 'start_bus_stop'


class EndBusStopFilter(AutocompleteFilter):
    title = 'Parada/Terminal final'
    field_name = 'end_bus_stop'
