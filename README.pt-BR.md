<div align="center">

![versão](https://img.shields.io/badge/vers%C3%A3o-0.0.1%20alpha-9b1b14)
![plataforma](https://img.shields.io/badge/Windows-10%20%2F%2011-444)
![api](https://img.shields.io/badge/VR-OpenXR-c8a24a)
![licença](https://img.shields.io/badge/licen%C3%A7a-Freeware-444)

| ⬇ Baixar | ♥ Apoiar o projeto |
| :---: | :---: |
| [**Última versão**](../../releases/latest) | [**Doação**](https://ko-fi.com/josevitor11) |

[Como usar](#como-usar) · [Controles](#controles) · [O que falta ou não foi testado](#o-que-ainda-não-foi-implementado-ou-testado-bugs-que-notei) · [Compatibilidade](#compatibilidade) · [Bugs](#o-que-ainda-não-foi-implementado-ou-testado-bugs-que-notei) · [English](README.md)

</div>

> Mafia 2 foi o primeiro jogo que joguei na infância, e se tornou meu favorito, sempre quis jogar ele em VR e, no tempo livre, decidi criar esse mod. Esse mod está em versão inicial de desenvolvimento, pode apresentar bugs no decorrer da história e é necessário mais tempo para testar e corrigir. Mas já está 100% jogável.

---

## Coisas implementadas

- **3D estéreo nativo (beta), AFR opcional.**
- **Rastreamento da cabeça em 6DoF.**
- **Motion controls With 6-DOF:** use os controles do headset para mirar, atirar, recarregar manualmente, lutar e dirigir.
- **Poses das mãos e cinemática inversa (IK) dos braços.**
- **HUD adaptados à realidade virtual.** Use o pulso para ver o HUD do mapa.
- **Sistema de direção adaptada para realidade virtual:** volante controlado pelas mãos (mas pode ser girado usando analógicos), lockpick para destrancar carros, troca de estações do rádio e buzina por gesto.
- **Troca de armas por movimentos**, inspirada em *Half-Life: Alyx*.
- **Compatibilidade com OpenXR e SteamVR.** Testado com o Quest 2; há perfis de resolução e controle para outros headsets, **ainda não testados.**
- **Recarga manual para todas as armas** (ainda precisa de polimento).
- **Sistema de combate adaptado à realidade virtual.** Pode usar as mãos para dar socos ou usar os gatilhos dos controles (ainda precisa de polimento).
- **Antialiasing FXAA (beta).**
- **Cenas, menus de seleção em flat para evitar enjoo.**

## Compatibilidade

> **IMPORTANTE:** Mafia II Classic é um jogo de 32 bits, e o executável precisa do patch de 4 GB para o executável usar 4 gigas de memória RAM e assim o mod funcionar corretamente. O M2VR foi desenvolvido para a versão 1.0.0.1 Complete Edition e depende de endereços fixos no executável para fazer o hook, usados pela (câmera, pelos disparos, pelas recargas, pelos ossos dos personagens e pelos menus — além de ler dados em posições específicas). A versão da Steam também funciona, mas apresentou vários bugs nos testes. Para resolver esses problemas, criei um patch `Patch-Mafia2.exe`, que aplica o patch de suporte a 4 GB de RAM e faz os ajustes de compatibilidade necessários ao executável da Steam ou a outras edições 1.0.0.1, deixando a versão da Steam 100% compatível com o mod.

| Item | Situação |
| --- | --- |
| Meta Quest 2 + Virtual Desktop | **Testado** |
| Quest 2 pelo SteamVR | A sessão de VR abriu e os controles funcionaram **Testado** |
| Quest 3 / 3S / Pro, Pico 4, Index, Reverb G2, Vive Pro 2, Beyond, PSVR2 | Apesar de ter perfis de controle e resolução no lançador para estes dispositivos, não sei como se comporta na prática, podem ocorrer bugs. |
| `mafia2.exe` **1.0.0.1** **Digital Deluxe Edition** (100% compatível) | (Necessário aplicar patch de 4 GB de RAM) |
| `mafia2.exe` **1.0.0.1** **Steam Version** (100% compatível com patch personalizado) | Pela forma que o mod foi feito a versão do executável protegida, apesar de funcionar, apresenta muitos bugs, pra isso criei um patch para o executável do Mafia 2 da Steam que aplica o patch de 4 GB de RAM e modifica alguns setores do executável e torna 100% compatível com o mod. |
| Mafia II Definitive Edition | Não é suportado |

Requisitos: Windows 10/11, GPU com Vulkan (por causa do DXVK), runtime OpenXR de **32 bits** ativo (Virtual Desktop, Meta Link ou SteamVR), Visual C++ Redistributable 2015-2022 **x86** e .NET Framework 4.x (já vem no Windows).

## Como usar

### Instalação automática (recomendada)

1. Baixe e execute **`M2VR-Installer-0.0.1.exe`**.
2. Siga as instruções (**Avançar**, aceite a licença e escolha a pasta do jogo). O instalador localiza a pasta do jogo ou permite selecionar a pasta que contém `mafia2.exe`, copia os arquivos do mod, detecta automaticamente a versão do jogo e aplica o patch necessário para deixar o executável do build suportado 100% compatível com o M2VR e o patch para 4 GB de memória e cria um atalho do M2VR Launcher na área de trabalho.

### Instalação manual

Copie estes arquivos para a pasta onde está o `mafia2.exe`:

| Arquivo | Função | Origem |
| --- | --- | --- |
| `m2vr.asi` | mod de VR | pacote **ZIP** da página de Releases |
| `M2VR-Launcher.exe` | lançador do M2VR | mesmo ZIP |
| `m2vr.ini` | arquivo de configuração | mesmo ZIP |
| `dinput8.dll` | carrega o `m2vr.asi` | [Ultimate ASI Loader](https://github.com/ThirteenAG/Ultimate-ASI-Loader) (32 bits) |
| `d3d9.dll` | executa Direct3D 9 sobre Vulkan | [DXVK](https://github.com/doitsujin/dxvk) (32 bits) |
| `openxr_loader.dll` + `jsoncpp.dll` | arquivos do loader OpenXR | [OpenXR-SDK](https://github.com/KhronosGroup/OpenXR-SDK) (32 bits) |
| `Patch-Mafia2.exe` "Directory Mafia2/pc" | aplica os patches de compatibilidade e o patch de 4 GB | pacote do M2VR |

## Controles

> **Observação:** No primeiro capítulo existem alguns tutoriais para avançar no jogo, para subir a janela inicial aperte trigger esquerdo, depois o jogo pede pra ficar em cover no canto da porta pra avançar, basta chegar perto e apertar A para entrar no modo cover, depois pode sair.

**A pé**

| Controle | Ação |
| --- | --- |
| Analógico esquerdo | andar: pouco inclinado = devagar, médio = normal, até o fim (ou clique) = correr |
| Analógico direito | girar a câmera (ou gire o corpo; o personagem acompanha a vista) |
| Gatilho direito | atirar |
| Gatilho esquerdo | **Espaço** (pular obstáculo / esquivar). |
| Grip esquerdo | segurar a arma com duas mãos; pegar o pente no cinto |
| Clique do analógico direito + mover a mão | trocar de arma |
| **X** (esquerdo) | **1 toque** = (entra no carro no modo normal); **2 toques seguidos** = (quebrar a janela do carro e entrar); **3 ou mais** = (entrar em carro burlando a porta usando lockpick); **segurar 3 s** = (ir para o Menu Principal) |
| **B** (direito) | toque = F, segurar = F segurado, 2 toques = Q |
| **A** (direito) | interagir (E); 3 toques rápidos = Q |
| **Y** (esquerdo) | mapa |

**Luta (sem arma na mão)**

| Controle | Ação |
| --- | --- |
| Mãos juntas no rosto | defesa / esquiva |
| Grip direito + soco com a mão | soco **fraco** |
| Grip esquerdo + soco com a mão | soco **forte** |
| Grip direito + gatilho direito (Necessário tirar as mãos da região do rosto para sair do modo esquiva) | soco **fraco** por botão |
| Grip esquerdo + gatilho esquerdo (Necessário tirar as mãos da região do rosto para sair do modo esquiva) | soco **forte** por botão |

**Armas e recarga**

| Gesto | Ação |
| --- | --- |
| Pente zerou | leve a mão esquerda ao cinto, feche o grip para pegar o pente e **encaixe na arma** |
| Depois do pente | segure a peça da arma (ferrolho/corrediça) com o grip esquerdo, puxe para trás e solte para armar |
| Espingarda | ponha os cartuchos e puxe o cano para trás para bombear |
| Granada / molotov | segure o grip direito para preparar, arremesse com as mãos com gatilho direito (Faltando polimento) |

**No carro**

| Controle | Ação |
| --- | --- |
| Mãos no volante + grip (mão esquerda ou direita ou ambas para mais estabilidade) + apertar trigger de pressão para diminuir ou aumentar velocidade do carro (trigger esquerdo dá ré, trigger direito acelera) ou dá pra usar o analógico esquerdo pra girar o volante | dirigir (soltar o grip solta o volante) |
| Gatilho direito / esquerdo | acelerar / frear e dar ré |
| Mão no centro do volante | buzina |
| Mão direita no botão do rádio + grip, girar | trocar de estação |
| X (1 toque) / A | sair |
| Lockpick (porta trancada) | X várias vezes seguidas; depois suba a mão direita para subir a travinha e aperte o **A** na hora certa |

**Nos menus:** aponte com o controle direito (ele vira o mouse), se der bug também pode movimentar o cursor com analógico direito, **A** ou o gatilho direito clicam, **B** volta, para centralizar a câmera no corpo segure o atalho padrão do menu esquerdo durante alguns segundos ou F10.

## O que ainda não foi implementado ou testado, Bugs que notei

| Item | Situação |
| --- | --- |
| **Sem o patch de 4 GB** | não roda; reduzir o uso de memória do mod para caber em 2 GB é uma ideia futura |
| **Outros headsets** (Quest 3/Pro, Pico 4, Index, Reverb G2, Vive Pro 2, Beyond, PSVR2) | perfis existem no lançador, **nada testado** |
| **Sensibilidade de gatilho e grip** configurável | hoje o ponto de ativação é fixo; planejado |
| **Menu de ajustes dentro do jogo** | não existe; use o lançador e o `m2vr.ini` |
| **Cursor em menus, compras e mapa** | Recomendamos mover o cursor com o analógico. O controle pelo movimento da mão ainda pode falhar. |
| **Câmera em finalizações de luta** | Às vezes, a câmera termina com a rotação incorreta. |
| **Mafia II Definitive Edition** (64 bits) | não suportado; seria um mod separado |
| **Linux / Wine** | não testado |
| **Sistema de cover realista que acompanha a altura do jogador** | Será implementado nas próximas atualizações |

O jogo ainda está em fase inicial de testes. Há alguns bugs, mas eles não impedem jogar toda a campanha principal; continuo trabalhando nas correções.

## Créditos e licenças

- **O M2VR é freeware.** O código-fonte **não é publicado**; este repositório traz só a documentação e as Releases. Você pode redistribuir o pacote oficial **sem alterações**, completo e junto com os arquivos [LICENSE](LICENSE) e [THIRD_PARTY_LICENSES.md](THIRD_PARTY_LICENSES.md). Veja o [LICENSE](LICENSE) para os termos completos.
- [MinHook](https://github.com/TsudaKageyu/minhook) (BSD 2-Clause), compilado dentro do `m2vr.asi`.
- Usados na instalação, cada um com a própria licença: DXVK (zlib), Ultimate ASI Loader (MIT), OpenXR loader (Apache-2.0), jsoncpp (MIT). O patch de 4 GB do instalador só liga uma bandeira no cabeçalho do exe.
- *Mafia II* é marca e propriedade de seus donos. Projeto feito por fãs, sem fins lucrativos, sem arquivos do jogo.
