// "banyak orang pakai NixOS bertahun-tahun tapi tidak benar-benar paham Nix"

- Belajarlah cara menggunakan nix commands seperti `nix eval`, `nix run`, `nix repl`, `nix-shell`, `nix develop` etc..
- Satu pertanyaan sebelum melanjutkan, ini mempengaruhi seberapa paham anda terhadap pemrograman nix.
// apakah untuk menjalankan bahasa nix butuh jaringan internet?

## Nix BUKAN shell scripts, BUKAN ansible, juga BUKAN Docker
| System | Cara Kerja |
|--------|------------|
| Bash,Arch | Lakukan langkah A -> B -> C |
| Ansible | langkah A dengan idempotensi |
| Docker | Bangun image -> jalankan Container |
| Nix | "Deskripsikan hasil Akhir" |

// "Nix adalah bahasa Declarative, yaitu mendeklarasikan akhir variabels"

**Contoh**
<div>
    <p align="left">
        ```bash
            a = 1
            b = 2
            echo $((a + b)) //3
            
        ```
    </p>
    <p align="right">
        ```nix
            let
                a = 1
                b = 2
            in
            a + b //3
            
        ```
    </p>
</div>

!untuk masuk mode nix di terminal = `nix repl`

## Mesin Asli NixOS (sejak dulu)
- sebelum flake ada, NixOS sudah punya "mesin":
nixos-rebuild -> nix-instantiate
nix-instantiate -> NixOS module system
NixOS module system -> derivations
- Mesin utamanya bukan flake, tapi:
// NixOS "MODULE SYSTEM" + nixpkgs

## alur kerja configuration.nix tanpa flake

```configuration.nix
{ config, pkgs, ...}:
{
    services.openssh.enable = true;
}
```

jalankan `nixos-rebuild switch`
maka proses rebuild yang terjadi:
```Text
nixos-rebuild
-> load nixpkgs
-> load module system
-> masukkan configuration.nix sebagai enable
-> evaluasi semua module
-> hasilkan system derivation

NB: Configration.nix tidak berdiri sendiri, tetapi selalu dipanggil oleh "SISTEM MODULE"
```

## bagaimana jika menggunakan flake?
- flake itu adalah "mesin baru yang ditambahkan untuk membungkus modules.
- configuration.nix itu adalah salah satu module dalam flake.
- jadi MODULE SYSTEM akan memanggil flake itu duluan (beserta module-module yang ada didalamnya).

```flake.nix
outputs = { nixpkgs, ... }: {
    nixosConfigurations.<hostname> = nixpkgs.lib.nixosSystem {
        modules = [
            ./configuration.nix  // configuration.nix sebagai module dalam flake.nix
            ... // module - module akan dideklarasikan disini.
        ];
    };
};
```
Tugas flake disini yaitu:
- mendefinisikan input.
- menentukan entry point.
- bikin evaluasi lebih BERSIH(pure).

!Kesimpulan penting:
// Module tidak butuh flake, flakelah yang butuh module.

## apakah Nix bisa menjalankan script.nix secara "Runtime" layaknya python/node?

// nix tidak menjalankan script, Nix mengevaluasi ekspresi. 
jika kita punya file script.nix:
```nix
# name: "Hello $(name)"
```
maka cara mengevaluasi file nix ini dengan : 
```shell
nix eval --file script.nix --argstr name World
```

Maka akan mengeluarkan output -> Hello World

// ini bukan Runtime, ini Evaluation

Jika mau menjalankan Program, Nix bukan bahasa runtime seperti python/nodejs, nix dipakai untuk:
- Mendefinisikan Environtment/Build, bukan menjalankan binary atau menjalankan bash/script penuh.
- contoh :
```nix
pkgs.writeShellScriptBin "Hello" ''
    echo "Hello World"
'';

// Nix menghasilkan Program, bukan menjalankannya
```

## apa itu set, let, rec, dan with?
1. `set` adalah struktur data atribut yang mirip seperti Object dalam Javascript. juga bisa di nest attributnya.
```nix
{
    nama: "Moch";
    version: "0.1";
}
```

// cara menggunakan/mengaksesnya :
```nix
attrs.name
```
- bisa juga dalam bentuk nest (Nested Attribute)
```nix
{
    system = {
        services = {
            ssh = {
                enable = true;
            }
        }
    }
}
```
Akses:
```
system.services.ssh.enable = true;
```
2. `let ... in` (Scope local), mendefinisikan binding local(variable) yang hanya hidup di ekspresi `in` (tempat mendeklarasi variable).
```nix
let
    a = 1;
    b = 2;
in
a + b
```
3. `rec` (Self Reference)
```nix
rec {
    x = 1
    y = x + 1
}
```
4. `with` merupakan wrapper praktis yang dipakai didalam array.
```nix
with pkgs; [
    vim
    git
]
```
// Ekspresi with sanngat penting nanti di bagian **referential transparency** dan **refactor aman** di Nix.

## Function di nix (yang sering bikin keliru)
- kenapa `{ pkgs, ... }:` itu function? bukan "syntax aneh".
// Function di Nix selalu satu argumen 
```nix
x: x + 1 

# ini Expression yang menghasilkan function.
```
uji dengan nix `nix repl`
```nix
(x: x + 1) 5
# 6 
```
- argumen tidak menggunakan tanda kurung `f(5)`
- Spasi = application

## partial (function) Application
- konsep yang lebih advanced = `(function : function)`
```nix
f = a: b: a + b;
```
ini sama dengan `f = a: (b: a + b)`




