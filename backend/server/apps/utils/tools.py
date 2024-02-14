def hide_last_4_digits_rut(rut: str) -> str:
    if "-" in rut:
        rut_results = rut.split("-")
        return rut_results[0][:-3] + "XXX" + "-X"
    else:
        return rut
