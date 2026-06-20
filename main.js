document
.getElementById("contactForm")
?.addEventListener("submit", function(e)
{
    e.preventDefault();

    const name =
        document.getElementById("name").value;

    const email =
        document.getElementById("email").value;

    const phone =
        document.getElementById("phone").value;

    const subject =
        document.getElementById("subject").value;

    const message =
        document.getElementById("message").value;

    const body =
`Név: ${name}

Email: ${email}

Telefonszám: ${phone}

Tárgy: ${subject}

Üzenet:

${message}`;

    const mailtoLink =
        `mailto:hajnikj25@gmail.com?subject=${
            encodeURIComponent(subject)
        }&body=${
            encodeURIComponent(body)
        }`;

    window.location.href = mailtoLink;
});
