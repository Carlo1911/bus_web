from base64 import b64encode
from io import BytesIO

import qrcode
import qrcode.image.svg


def create_qr(data: str) -> str:
    """Function to create a QR code from a string.

    :param data: a string to be converted to a QR code
    :type data: str
    :return: a string containing the SVG code of the QR code
    :rtype: str
    """
    factory = qrcode.image.svg.SvgImage
    qr = qrcode.make(
        data,
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        image_factory=factory,
        box_size=10,
        border=2,
    )
    stream = BytesIO()
    qr.save(stream)
    return "data:image/svg+xml;charset=utf-8;base64," + b64encode(qr.to_string()).decode()
