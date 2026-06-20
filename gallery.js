const galleryData =
    window.galleryData || {};

document
.querySelectorAll("[data-gallery-section]")
.forEach(function(gallery)
{
    const section =
        gallery.dataset.gallerySection;

    const images =
        galleryData[section] || [];

    gallery.replaceChildren(
        ...images.map(function(image)
        {
            const img =
                document.createElement("img");

            img.src =
                image.src;

            img.alt =
                image.alt || "";

            img.loading =
                "lazy";

            return img;
        })
    );

    if (images.length === 0)
    {
        gallery.hidden =
            true;
    }
});
