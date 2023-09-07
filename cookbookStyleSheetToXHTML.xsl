<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output
        method="html"
        omit-xml-declaration="yes"
        encoding="UTF-8"
        indent="yes"/>

<xsl:template match="/">

    <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
            <style>
                table, th, td {
                    padding: 2px;
                    border: 1px solid;
                }
            </style>
        </head>
        <body>
            <h1>Dishes and ingredients</h1>
            <table>
                <tr>
                    <th>Dish name</th>
                    <th>Ingredients</th>
                </tr>

                <xsl:for-each select="/cookbook/pageContent/recipes/recipe">
                    <xsl:sort select="/cookbook/pageContent/recipes/recipe/dishInfo/dishName"/>
                    <tr>
                        <th><xsl:value-of select="dishInfo/dishName"/></th>

                        <xsl:for-each select="dishIngredients/dishIngredient">
                            <xsl:sort select="@dishIngredientID"/>
                            <td><xsl:value-of select="dishIngredientName"/>: <xsl:value-of select="dishIngredientQuantity"/><xsl:if test="dishIngredientQuantity/@unit != 'ea'"><xsl:value-of select="dishIngredientQuantity/@unit"/></xsl:if></td>
                        </xsl:for-each>
                    </tr>
                </xsl:for-each>
            </table>
        </body>
    </html>

</xsl:template>

</xsl:stylesheet>
