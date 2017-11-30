Return-Path: tbskyd@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50062045
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 06:09:09 +0000 (UTC)
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
 [209.85.128.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efb94e85
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 06:09:09 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id y21so5521449wrc.1
 for <wireguard@lists.zx2c4.com>; Wed, 29 Nov 2017 22:15:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9rquEO5r0cMpTgPsLW790QqbN9DLxuETm-6TfxX9ULsVg@mail.gmail.com>
References: <CAC6SzH+Q-1SRVXOoScGhXWraOLdp9_Rud6cMbQ95a51r=eRWTw@mail.gmail.com>
 <CAHmME9piZhSukf55XY1Un2hO0TZyfHRh+afU8kk6R6yoSA5pQA@mail.gmail.com>
 <CAC6SzHJZj5BOMek4i=1ykepHSzHRDGKYTj-Cfa4veRbsVuj2WA@mail.gmail.com>
 <CAHmME9qeUw5VsaEoAG=i0=5LfOq4aPGi2KjDHKDjAPorXKJgbA@mail.gmail.com>
 <CAC6SzHJd8DzMBhuoGG=c8gtKzKd1zFs6wndKF0mEZDQW0aB6aQ@mail.gmail.com>
 <20171129135124.GA29970@zx2c4.com>
 <CAC6SzH+yoUtuim6oHypPXmef-oh2rQZTdQXDuN5YAGteXHN7rQ@mail.gmail.com>
 <CAHmME9pjU_5AncEkqYbnSUtB-h5h1nhrD5FXgkBia-sj=8jKrA@mail.gmail.com>
 <CAC6SzHJ8Rd3G7KWng5JxhXV4k2OE+uf5XKQNF3k6bzsDP=wUWA@mail.gmail.com>
 <CAHmME9rquEO5r0cMpTgPsLW790QqbN9DLxuETm-6TfxX9ULsVg@mail.gmail.com>
From: d tbsky <tbskyd@gmail.com>
Date: Thu, 30 Nov 2017 14:15:14 +0800
Message-ID: <CAC6SzHJJvFUkY-+DWXBP3D86KXtEv0U+vY4VN3ce0v=Fpk4T4g@mail.gmail.com>
Subject: Re: multi-home difficulty
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

2017-11-29 22:49 GMT+08:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> On Wed, Nov 29, 2017 at 3:16 PM, d tbsky <tbskyd@gmail.com> wrote:
>>      sorry I misunderstand you. you mean I modify the script and run
>> in my environment to reveal the problem?
>> ok I will try to do it.
>
> Take what I sent you. Run it. If it breaks, send me the output and
> your kernel. If it doesn't break, mess with it until it breaks, and
> then send it back to me.

Hi jason:

 "uname -a" result:

 Linux localhost.localdomain 3.10.0-693.5.2.el7.x86_64 #1 SMP Thu Oct
19 10:13:14 CDT 2017 x86_64 x86_64 x86_64 GNU/Linux

 your original script runs fine under my environment.
 I add  three 3 lines before "ip1 link add veth1"  to reveal the problem:

ip1 link add dummy0 type dummy
ip1 addr add 10.0.0.10/24 dev dummy0
ip1 link set dummy0 up

===== whole script below ======
#!/bin/bash
set -e

exec 3>&1
export WG_HIDE_KEYS=never
netns1="wg-test-$$-1"
netns2="wg-test-$$-2"
pretty() { echo -e "\x1b[32m\x1b[1m[+] ${1:+NS$1: }${2}\x1b[0m" >&3; }
pp() { pretty "" "$*"; "$@"; }
maybe_exec() { if [[ $BASHPID -eq $$ ]]; then "$@"; else exec "$@"; fi; }
n1() { pretty 1 "$*"; maybe_exec ip netns exec $netns1 "$@"; }
n2() { pretty 2 "$*"; maybe_exec ip netns exec $netns2 "$@"; }
ip1() { pretty 1 "ip $*"; ip -n $netns1 "$@"; }
ip2() { pretty 2 "ip $*"; ip -n $netns2 "$@"; }
sleep() { read -t "$1" -N 0 || true; }
waitiface() { pretty "${1//*-}" "wait for $2 to come up"; ip netns
exec "$1" bash -c "while [[ \$(< \"/sys/class/net/$2/operstate\") !=
up ]]; do read -t .1 -N 0 || true; done;"; }

cleanup() {
        set +e
        exec 2>/dev/null
        ip1 link del dev wg0
        ip2 link del dev wg0
        local to_kill="$(ip netns pids $netns1) $(ip netns pids $netns2)"
        [[ -n $to_kill ]] && kill $to_kill
        pp ip netns del $netns1
        pp ip netns del $netns2
        exit
}

trap cleanup EXIT

ip netns del $netns1 2>/dev/null || true
ip netns del $netns2 2>/dev/null || true
pp ip netns add $netns1
pp ip netns add $netns2

key1="$(pp wg genkey)"
key2="$(pp wg genkey)"
pub1="$(pp wg pubkey <<<"$key1")"
pub2="$(pp wg pubkey <<<"$key2")"
psk="$(pp wg genpsk)"
[[ -n $key1 && -n $key2 && -n $psk ]]

configure_peers() {
        ip1 addr add 192.168.241.1/24 dev wg0
        ip2 addr add 192.168.241.2/24 dev wg0

        n1 wg set wg0 \
                private-key <(echo "$key1") \
                listen-port 1 \
                peer "$pub2" \
                        preshared-key <(echo "$psk") \
                        allowed-ips 192.168.241.2/32,fd00::2/128
        n2 wg set wg0 \
                private-key <(echo "$key2") \
                listen-port 2 \
                peer "$pub1" \
                        preshared-key <(echo "$psk") \
                        allowed-ips 192.168.241.1/32,fd00::1/128

        ip1 link set up dev wg0
        ip2 link set up dev wg0
}

n1 bash -c 'echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6'
n2 bash -c 'echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6'
n1 bash -c 'echo 1 > /proc/sys/net/ipv6/conf/default/disable_ipv6'
n2 bash -c 'echo 1 > /proc/sys/net/ipv6/conf/default/disable_ipv6'

ip1 link add dev wg0 type wireguard
ip2 link add dev wg0 type wireguard
configure_peers

ip1 link add dummy0 type dummy
ip1 addr add 10.0.0.10/24 dev dummy0
ip1 link set dummy0 up

ip1 link add veth1 type veth peer name veth2
ip1 link set veth2 netns $netns2

ip1 addr add 10.0.0.1/24 dev veth1
ip1 addr add 10.0.0.2/24 dev veth1
ip2 addr add 10.0.0.3/24 dev veth2

ip1 link set veth1 up
ip2 link set veth2 up
waitiface $netns1 veth1
waitiface $netns2 veth2

n1 iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
n2 iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

n2 wg set wg0 peer "$pub1" endpoint 10.0.0.1:1
n2 ping -W 1 -c 5 -f 192.168.241.1
[[ $(n2 wg show wg0 endpoints) == "$pub1        10.0.0.1:1" ]]

n1 conntrack -L
n2 conntrack -L

n2 wg set wg0 peer "$pub1" endpoint 10.0.0.2:1
n2 ping -W 1 -c 5 -f 192.168.241.1
[[ $(n2 wg show wg0 endpoints) == "$pub1        10.0.0.2:1" ]]

n1 conntrack -L
n2 conntrack -L
