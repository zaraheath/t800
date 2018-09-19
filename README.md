# T800 Code test

## Spanish
Estimado Sargento Kyle Reese,

Apreciamos la labor que ha realizado durante todos estos años en la Resistencia. Es notablemente conocida su habilidad y conocimiento de la batalla y el armamento. Es por ello que necesitamos su ayuda para modificación de un modelo T­800 que acabamos de capturar. Como ya sabrá por su extensa experiencia, éste es el primer organismo cibernético que usaba tejido vivo sobre un esqueleto de metal.

Su **misión** consistirá en reprogramar el **módulo de selección de objetivos**.​ Dicho módulo es el encargado de seleccionar la siguiente posición a atacar dadas varias zonas de ataque. La unidad de control del cyborg se comunicará mediante peticiones HTTP POST con su módulo, proporcionándole los datos que el módulo de visión ha recogido.

El objetivo de la misión es desarrollar un **endpoint HTTP** que acepte datos **JSON** y devuelva datos **JSON**​.

Le proporcionamos un ejemplo de una petición de la unidad de control a su módulo:

~~~
[{"attack­mode":["closest­first"],"radar":[{"position":{"x":0,"
y":40},"targets":[{"type":"T1­9","damage":80},{"type":"HK­Tank,
"damage":20},{"type":"Human"}]},{"position":{"x":2,"y":60},"tar
gets":[{"type":"T1­9","damage":40}]},...
~~~

Y aquí una definición de sus parámetros:

- **Attack­mode​**. Modo elegido para el ataque
- **Radar**
    - **Position​**. Posición del grupo de Targets
        - **X**. ​Coordenada X
        - **Y**. ​Coordenada Y
    - **Targets​**. Objetivos encontrados
        - **Type**​. Tipo de objetivo
        - **Damage​**. Daño que el objetivo puede causarnos
        
Dada la petición anterior, su módulo debería de responder con:

~~~
{"position":{"x":0,"y":40},"targets":["T1­9","HK­Tank"]}
~~~

Los modos de ataque que tenemos implementados son:
- **Closest­first​**: Atacar las zonas más cercanas.
- **Furthest­first**​: Atacar las zonas más lejanas.
- **Avoid­crossfire**​: No se debe atacar ninguna zona donde se encuentre algún humano.
- **Priorize­t­x​**: Se debe priorizar siempre el ataque sobre los objetivos de tipo T­X.

Los tipos de objetivos que el sistema de visión proporcionará son:
- **Humanos**
- **T1­9**
- **T7­T**
- **T­X**
- **HK Airstrike**
- **HK­Bomber**
- **HK­Tank**

Tendrás que tener en cuenta que los modos de ataque se pueden encadenar, eso sí, no se podrán encadenar modos de ataque opuestos, cómo closest­first y furthest­first al mismo tiempo. Ejemplo:

~~~
[{"attack­mode":["closest­first", "Priorize­t­x"],"radar": ...
~~~

No debes olvidar que Skynet está construyendo un nuevo ejército de cyborg, el sistema deberá estar preparado para añadir nuevos modos de ataque.

test_cases.txt​: https://github.com/zaraheath/t800/blob/master/test_cases.txt​

test_attack.sh: https://github.com/zaraheath/t800/blob/master/test_attack.sh


Deberás tener curl instalado y ejecutar el comando ./test_attack.sh en tu máquina. Tendrás acceso a una batería de pruebas para probar tu módulo de combate.

Good luck,

The Resistance

## English

Dear Sergeant Kyle Reese,

We appreciate the work you have done over all these years in the Resistance. Your skill and knowledge of battle and weaponry is well known. That is why we need your help to modify a T800 model that we have just captured. As you know from your extensive experience, this is the first cybernetic organism to use living tissue on a metal skeleton.

Your **mission** will consist of reprogramming the **target selection module**. This module is in charge of selecting the next position to attack given several attack zones. The control unit of the cyborg will communicate via HTTP POST requests with the module, providing the data that the vision module has collected.

The goal of the mission is to develop an **HTTP endpoint** that accepts **JSON** data and returns **JSON** data.

We provide an example of a request from the control unit to your module:


~~~
[{"attack­mode":["closest­first"],"radar":[{"position":{"x":0,"
y":40},"targets":[{"type":"T1­9","damage":80},{"type":"HK­Tank,
"damage":20},{"type":"Human"}]},{"position":{"x":2,"y":60},"tar
gets":[{"type":"T1­9","damage":40}]},...
~~~

And here is a definition of the parameters:

- **Attack-mode**. Chosen mode for the attack
- **Radar**
    - **Position**. Targets group position
        - **X**. X-coordinate
        - **Y**. Y-coordinate
    - **Targets**. Objectives found
        - **Type**. Type of objective
        - **Damage**. Damage the target can cause us
        
Given the above request, your module should respond with:

~~~
{"position":{"x":0,"y":40},"targets":["T1­9","HK­Tank"]}
~~~

The attack modes we have implemented are:
- **Closest-first**: Attack the nearest zones.
- **Furthest-first**: Attack the most distant areas.
- **Avoid-crossfire**: Don't attack any zone where any human is.
- **Priorize-t-x**: The attack must always be prioritized over T-X type targets.

The types of targets that the vision system will provide are:
- **Human**
- **T1­9**
- **T7­T**
- **T­X**
- **HK Airstrike**
- **HK­Bomber**
- **HK­Tank**

You'll have to keep in mind that attack modes can be chained, but you can't chained opposite attack modes, like closest-first and furthest-first at the same time. Example:

~~~
[{"attack­mode":["closest­first", "Priorize­t­x"],"radar": ...
~~~

Don't forget that Skynet is building a new cyborg army, the system must be ready to add new attack modes.

test_cases.txt​: https://github.com/zaraheath/t800/blob/master/test_cases.txt​

test_attack.sh: https://github.com/zaraheath/t800/blob/master/test_attack.sh

You must have curl installed and run the ./test_attack.sh command on your machine. You will have access to a battery of tests to test your combat module.

Good luck,

The Resistance

