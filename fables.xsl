<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">

    <!-- 1. INSTRUCTION D'OUTPUT : HTML -->
    <xsl:output method="html" indent="yes" encoding="UTF-8"/>



    <!-- 2. VARIABLES -->

    <xsl:variable name="accueil">
        <!-- variable pour le contenu de l'accueil -->
        <xsl:value-of select="concat('accueil', '.html')"/>
    </xsl:variable>
    <xsl:variable name="fable20">
        <!-- variable pour le contenu de la fable 20 -->
        <xsl:value-of select="concat('fable20', '.html')"/>
    </xsl:variable>
    <xsl:variable name="fable21">
        <!-- variable pour le contenu de la fable 21 -->
        <xsl:value-of select="concat('fable21', '.html')"/>
    </xsl:variable>
    <xsl:variable name="fable22">
        <!-- variable pour le contenu de la fable 22 -->
        <xsl:value-of select="concat('fable22', '.html')"/>
    </xsl:variable>


    <!-- VARIABLE AVEC LE HEAD -->
    <xsl:variable name="header">
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <title>
                <xsl:value-of select="//titleStmt/title"/>
            </title>
            <meta name="description">
                <xsl:attribute name="content">
                    <xsl:value-of select="//titleStmt/title"/>
                </xsl:attribute>
            </meta>

            <!-- liens vers bootstrap et jquery pour le style -->
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"/>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"/>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
                crossorigin="anonymous"/>
            <link rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"/>
            
            <!-- habillage css des fichiers -->
            <style>
                html {
                    scroll-behavior: smooth;
                }
                
                body {
                    background-repeat: no-repeat;
                    background-size: cover;
                    width: auto;
                    margin: auto;
                    padding: 10px 50px 20px;
                    border-radius: 0px;
                    box-shadow: 1px 1px 10px black;
                    color: rgb(79, 87, 82);
                    text-align: justify;
                    max-width: 800px;
                }
            
                .box {
                    background-color: white;
                    padding: 15px 75px 45px 75px;
                }
                
                
                table {
                border-collapse: collapse;
                border: outset 2px;
                margin: auto;
                }
                
                th, td {
                padding: 15px;
                border: outset 2px;
                background-color: rgba(210, 220, 216, 0.3);
                width: auto;
                height: auto%;
                }
                
                .title {
                text-align: center;
                font-style: italic;
                }
                a:link {
                text-decoration: none;
                }
                
                a:visited {
                text-decoration:underline;
                }
                
                a:hover {
                text-decoration: underline;
                }
                
                a:active {
                text-decoration: underline;
                }
            </style>
        </head>
    </xsl:variable>

    <!-- VARIABLE AVEC LE <FOOTER> -->
    <xsl:variable name="footer">
        <footer
            style="color : black; background-color: rgb(235, 235, 235); padding: 10px; border-radius: 0px; box-shadow: 1px 1px 10px black;">
            <p>
                <i> Travail réalisé par <xsl:value-of select="//titleStmt/author/persName"/>
                </i>
            </p>
            <p>

                <ul>
                    <li>
                        <a href="https://gallica.bnf.fr/ark:/12148/btv1b8610825d/f1">Source
                            textuelle :</a>
                        <xsl:value-of select="//sourceDesc//title"/><xsl:value-of
                            select="//sourceDesc//author"/>. </li>
                    <li>
                        <a
                            href="https://www.editions-hazan.fr/livre/les-fables-de-la-fontaine-illustrees-par-chagall-version-grand-format-9782754113328/"
                            >Source visuelle :</a><em>Les deux pigeons</em> de la Série Les Fables
                        de la Fontaine illustrées par Marc Chagall (1887-1985). Il s'agit d'une
                        gouache sur papier Velin réalisée entre 1926 et 1930, de 40 x 30,5 cm et
                        donc la localication reste inconnue. </li>
                </ul>

            </p>
        </footer>
    </xsl:variable>

    <!-- VARIABLE AVEC LE CSS DU <BODY>-->
    <xsl:variable name="body_css">
        <xsl:text>margin: 3% auto; text-align: justify; padding: 20px; max-width: 800px;</xsl:text>
    </xsl:variable>

    <!-- VARIABLES AVEC LES LIENS DE RETOUR -->
    <xsl:variable name="retour_accueil">
        <a href="{$accueil}" class="nav-link text-black hover-darker">Accueil <i
                class="bi bi-house-fill"/></a>
    </xsl:variable>

    <!-- VARIABLE AVEC L'EN-TÊTE DU <BODY> DES PAGES -->
    <xsl:variable name="body_header">
        <div
            style="text-align: center; margin-bottom: 8%; font-family: Arial, sans-serif; font-size: 20px; background-color: rgb(239, 231, 226); padding: 30px; border-radius: 0px; box-shadow: 1px 1px 10px black; background-image: url('html/image/chagall_illustration1.jpg'); background-size: cover;">
            <h1
                style="font-size: 2em; margin-bottom: 10px; height: auto; color: rgb(235, 235, 235);">
                <i>
                    <xsl:value-of select="//fileDesc/titleStmt/title"/>
                </i>
            </h1>


        </div>
    </xsl:variable>

    <!-- FIN DES DÉCLARATIONS DES VARIABLES -->


    <!-- 3. REGLES SUR LA RACINE : création de 5 documents HTML + appel des versions originales vs versions modernisées -->
    <xsl:template match="/">
        <xsl:call-template name="accueil"/>
        <xsl:call-template name="fable20"/>
        <xsl:call-template name="fable21"/>
        <xsl:call-template name="fable22"/>
    </xsl:template>


    <!-- 4. TEMPLATE DE LA PAGE D'ACCUEIL -->
    <xsl:template name="accueil">
        <xsl:result-document href="{$accueil}" method="html">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body>
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>

                    <div style="text-align: justify; ">
                        <p>
                            <b>Description du projet : </b>
                            <xsl:value-of select="//encodingDesc/projectDesc/p[1]"/>

                        </p>
                        <p>
                            <b> A propos des Fables : </b>
                            <xsl:value-of select="//encodingDesc/projectDesc/p[2]"/>
                        </p>

                    </div>

                    <div class="nav">
                        <p>
                            <b>Liens vers les pages du projet : </b>
                        </p>
                        <p><a href="./{$fable20}">Fable 20</a> – <a href="./{$fable21}">Fable 21</a>
                            – <a href="./{$fable22}">Fable 22</a></p>
                    </div>

                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- 5. TEMPLATE DE LA FABLE n°20 -->
    <xsl:template name="fable20">
        <xsl:result-document href="{$fable20}" method="html" indent="yes">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body class="container">
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div>
                        <p>
                            <xsl:copy-of select="$retour_accueil"/>
                        </p>
                    </div>
                    <h3>Comparer l'évolution de l'orthographe :</h3>
                    <div class="box">
                        <h2 class="title">
                            <xsl:value-of
                                select="//div[@type = 'part' and @n = '20']/head[@type = 'title'][1]"
                            />
                        </h2>
                        <table border="1">
                            <tr>
                                <th>Version originale</th>
                                <th>Version modernisée</th>
                            </tr>
                            <tr>
                                <td id="orig">
                                    <xsl:for-each
                                        select="//text/body/div[@type = 'part' and @n = '20']/l">
                                        <div>
                                            <p>
                                                <xsl:apply-templates mode="orig"/>
                                            </p>
                                        </div>
                                    </xsl:for-each>
                                </td>

                                <td id="reg">
                                    <xsl:for-each
                                        select="//text/body/div[@type = 'part' and @n = '20']/l">
                                        <div>
                                            <p>
                                                <xsl:apply-templates mode="reg"/>
                                            </p>
                                        </div>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </table>

                        <div class="nav">
                            <p>
                                <b>Liens vers les pages du projet : </b>
                            </p>
                            <p><a href="./{$fable21}">Fable 21</a> – <a href="./{$fable22}">Fable
                                    22</a></p>
                        </div>

                        <xsl:copy-of select="$footer"/>
                    </div>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- 6. TEMPLATE DE LA FABLE n°21 -->
    <xsl:template name="fable21">
        <xsl:result-document href="{$fable21}" method="html" indent="yes">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body class="container">
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div>
                        <p>
                            <xsl:copy-of select="$retour_accueil"/>
                        </p>
                    </div>
                    <h2>Lecture comparée</h2>
                    <div class="box">

                        <h2 class="title">
                            <xsl:value-of
                                select="//div[@type = 'part' and @n = '21']/head[@type = 'title'][1]"
                            />
                        </h2>
                        <table border="1">
                            <tr>
                                <th>Version originale</th>
                                <th>Version modernisée</th>
                            </tr>
                            <tr>
                                <td id="orig">
                                    <xsl:for-each
                                        select="//text/body/div[@type = 'part' and @n = '21']/l">
                                        <div>
                                            <p>
                                                <xsl:apply-templates mode="orig"/>
                                            </p>
                                        </div>
                                    </xsl:for-each>
                                </td>

                                <td id="reg">
                                    <xsl:for-each
                                        select="//text/body/div[@type = 'part' and @n = '21']/l">
                                        <div>
                                            <p>
                                                <xsl:apply-templates mode="reg"/>
                                            </p>
                                        </div>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="nav">
                        <p>
                            <b>Liens vers les pages du projet : </b>
                        </p>
                        <p><a href="./{$fable20}">Fable 20</a> – <a href="./{$fable22}">Fable
                            22</a></p>
                    </div>

                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- 7. TEMPLATE DE LA FABLE n°22 -->
    <xsl:template name="fable22">
        <xsl:result-document href="{$fable22}" method="html" indent="yes">
            <html lang="fr">
                <xsl:copy-of select="$header"/>
                <body class="container">
                    <xsl:attribute name="style">
                        <xsl:value-of select="$body_css"/>
                    </xsl:attribute>
                    <xsl:copy-of select="$body_header"/>
                    <div>
                        <p>
                            <xsl:copy-of select="$retour_accueil"/>
                        </p>
                    </div>
                    <h2>Lecture comparée</h2>
                    <div class="box">
                        <h2 class="title">
                            <xsl:value-of
                                select="//div[@type = 'part' and @n = '22']/head[@type = 'title'][1]"
                            />
                        </h2>
                        <table border="1">
                            <tr>
                                <th>Version originale</th>
                                <th>Version modernisée</th>
                            </tr>
                            <tr>
                                <td id="orig">
                                    <xsl:for-each
                                        select="//text/body/div[@type = 'part' and @n = '22']/l">
                                        <div>
                                            <p>
                                                <xsl:apply-templates mode="orig"/>
                                            </p>
                                        </div>
                                    </xsl:for-each>
                                </td>

                                <td id="reg">
                                    <xsl:for-each
                                        select="//text/body/div[@type = 'part' and @n = '22']/l">
                                        <div>
                                            <p>
                                                <xsl:apply-templates mode="reg"/>
                                            </p>
                                        </div>
                                    </xsl:for-each>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="nav">
                        <p>
                            <b>Liens vers les pages du projet : </b>
                        </p>
                        <p><a href="./{$fable20}"> Fable 20</a> – <a href="./{$fable21}">Fable
                                21</a></p>
                    </div>

                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- SELECTION POUR TEXTE ORIGINAL & MODERNISE -->
    <xsl:template match="l" mode="orig">
        <xsl:apply-templates select="node()"/>
    </xsl:template>

    <xsl:template match="l" mode="reg">
        <xsl:apply-templates select="node()"/>
    </xsl:template>

    <xsl:template match="choice" mode="orig" name="orig">
        <xsl:apply-templates select="./orig"/>
    </xsl:template>
    
    <xsl:template match="choice" mode="reg" name="reg">
        <xsl:apply-templates select="./reg"/>
    </xsl:template>

</xsl:stylesheet>
