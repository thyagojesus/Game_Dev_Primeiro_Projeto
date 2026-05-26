# 🎮 Game Dev: Meu Primeiro Projeto 2D com Godot 4+

<p align="center">
  <img src="https://img.shields.io/badge/Engine-Godot_4.x-478CBF?logo=godot-engine&logoColor=white&style=for-the-badge" alt="Godot 4">
  <img src="https://img.shields.io/badge/Language-GDScript-478CBF?style=for-the-badge" alt="GDScript">
  <img src="https://img.shields.io/badge/Status-Em_Desenvolvimento-green?style=for-the-badge" alt="Status">
</p>

## 🧠 O Propósito do Projeto
Este repositório foi criado para documentar a minha jornada de aprendizado no desenvolvimento de jogos utilizando a **Godot Engine** e a linguagem **GDScript**. 

Mais do que apenas criar um jogo, este projeto tem como objetivo principal o desenvolvimento cognitivo, o estudo de lógica de programação aplicada a ambientes bidimensionais e a resolução de problemas complexos. Afinal, **o cérebro é como um músculo: se você parar de exercitá-lo, ele atrofia!** Correr atrás de novas tecnologias e arquiteturas de código é a minha forma de mantê-lo sempre ativo.

> 📺 **Base de Estudos:** O projeto está sendo desenvolvido e expandido acompanhando a excelente playlist de tutoriais do canal [Rafael Forbeck | Game Dev].

---

## 🚀 Conceitos e Funcionalidades Aprendidas

Ao longo do desenvolvimento deste jogo 2D, venho explorando e dominando os principais pilares da Godot:

* **Manipulação de Nós (Nodes) e Cenas:** Estruturação correta de componentes reutilizáveis dentro da árvore da engine.
* **Máquina de Estados Finita (FSM):** Organização e controle dos estados do jogador (Andar, Pular, Agachar, Levar Dano/Hurt).
* **Física e Detecção de Colisões (2D Physics):**
    * Uso estratégico de *Layers* e *Masks* para separar o que é Terreno, Jogador, Inimigos e Áreas Letais.
    * Ajuste e manipulação em tempo real via código das formas de colisão (`CollisionShape2D` e `Hitbox`), adaptando-as dinamicamente quando o player se agacha para desviar de projéteis.
* **Inteligência Artificial de Inimigos:** Lógica de patrulha, detecção do jogador com áreas de visão e comportamento de ataque (como o arremesso de projéteis por esqueletos).
* **Ciclo de Vida e Gerenciamento de Memória:** Instanciação dinâmica de objetos em cena (projéteis) e a importância do uso de Timers de autodestruição com `queue_free()` para prevenir *memory leaks* (vazamento de memória).
* **Animações 2D:** Sincronização de spritesheets e estados de movimento usando `AnimatedSprite2D`.

---

## 🛠️ Tecnologias Utilizadas

* **Engine:** Godot Engine (Versão 4.x)
* **Linguagem:** GDScript (Linguagem de script nativa de alto desempenho e tipagem dinâmica/estática da Godot)
* **Estilo Visual:** Pixel Art 2D

---

## 🎨 Estrutura do Projeto (Geral)

O projeto foca em boas práticas de organização de arquivos na Godot, dividindo os elementos essenciais de forma modular:

```text
├── characters/         # Nós, sprites e scripts do Player e Inimigos
├── levels/             # Mapas, TileMaps e componentes de ambiente
├── objects/            # Projéteis, colecionáveis e áreas letais
└── README.md           # Documentação do projeto