[#ftl]
<!DOCTYPE html>
<html lang="cs" xmlns="http://www.w3.org/1999/html">
<head>
    [#include "_common/head.ftlh"]
</head>
<body>
<div class="detail">
    <div class="vizitka">
        [#if vizitka.jmeno?has_content]
            <div class="jmeno">${vizitka.jmeno}</div>
        [/#if]
        [#if vizitka.firma?has_content]
            <div class="firma">${vizitka.firma}</div>
        [/#if]
        <div class="udaje">
            [#if vizitka.celaAdresa?has_content]
                <div class="adresa">
                    <div>${vizitka.celaAdresa}</div>
                </div>
            [/#if]
            <div class="kontakty">
                [#if vizitka.email?has_content]
                    <div><i class="bi bi-at"></i> <span>${vizitka.email}</span></div>
                [/#if]
                [#if vizitka.telefon?has_content]
                    <div><i class="bi bi-phone"></i> <span>${vizitka.telefon}</span></div>
                [/#if]
                [#if vizitka.web?has_content]
                    <div><i class="bi bi-globe"></i> <span>${vizitka.web}</span></div>
                [/#if]
            </div>
        </div>
    </div>

    <div class="mapa">
        <iframe style="border:none" src="https://frame.mapy.cz/?q=${vizitka.celaAdresa?url}" width="100%" height="100%"
                frameborder="0"></iframe>
    </div>

    <form action="/delete" method="post">
        <input type="hidden" name="id" value="${idVizitka}">
        <button type="submit" class="btn btn-primary">Smazat</button>
    </form>

    <nav>
        <a href="/">◂ zpět na seznam</a>
    </nav>
</div>
</body>
</html>
