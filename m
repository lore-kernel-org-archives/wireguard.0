Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 547de5da
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:45:29 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28baf074
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:45:28 +0000 (UTC)
Date: Wed, 29 Nov 2017 14:51:27 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: d tbsky <tbskyd@gmail.com>
Subject: Re: multi-home difficulty
Message-ID: <20171129135124.GA29970@zx2c4.com>
References: <CAC6SzH+Q-1SRVXOoScGhXWraOLdp9_Rud6cMbQ95a51r=eRWTw@mail.gmail.com>
 <CAHmME9piZhSukf55XY1Un2hO0TZyfHRh+afU8kk6R6yoSA5pQA@mail.gmail.com>
 <CAC6SzHJZj5BOMek4i=1ykepHSzHRDGKYTj-Cfa4veRbsVuj2WA@mail.gmail.com>
 <CAHmME9qeUw5VsaEoAG=i0=5LfOq4aPGi2KjDHKDjAPorXKJgbA@mail.gmail.com>
 <CAC6SzHJd8DzMBhuoGG=c8gtKzKd1zFs6wndKF0mEZDQW0aB6aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <CAC6SzHJd8DzMBhuoGG=c8gtKzKd1zFs6wndKF0mEZDQW0aB6aQ@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

I made a small script in order to reproduce this issue, but I was not
able to replicate the results. Would you spend some time with the below
code tweaking it so that it exhibits the broken behavior you're seeing?

Jason

==== script (please mind the use of literal \t) ====

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
waitiface() { pretty "${1//*-}" "wait for $2 to come up"; ip netns exec "$1" bash -c "while [[ \$(< \"/sys/class/net/$2/operstate\") != up ]]; do read -t .1 -N 0 || true; done;"; }

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
[[ $(n2 wg show wg0 endpoints) == "$pub1	10.0.0.1:1" ]]

n1 conntrack -L
n2 conntrack -L

n2 wg set wg0 peer "$pub1" endpoint 10.0.0.2:1
n2 ping -W 1 -c 5 -f 192.168.241.1
[[ $(n2 wg show wg0 endpoints) == "$pub1	10.0.0.2:1" ]]

n1 conntrack -L
n2 conntrack -L

==== output ====

[+] ip netns add wg-test-32269-1
[+] ip netns add wg-test-32269-2
[+] wg genkey
[+] wg genkey
[+] wg pubkey
[+] wg pubkey
[+] wg genpsk
[+] NS1: bash -c echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
[+] NS2: bash -c echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
[+] NS1: bash -c echo 1 > /proc/sys/net/ipv6/conf/default/disable_ipv6
[+] NS2: bash -c echo 1 > /proc/sys/net/ipv6/conf/default/disable_ipv6
[+] NS1: ip link add dev wg0 type wireguard
[+] NS2: ip link add dev wg0 type wireguard
[+] NS1: ip addr add 192.168.241.1/24 dev wg0
[+] NS2: ip addr add 192.168.241.2/24 dev wg0
[+] NS1: wg set wg0 private-key /dev/fd/63 listen-port 1 peer NNBvFmhApGEcgy8erS6bCLUi3+nRmg2mzV/xvek9PG0= preshared-key /dev/fd/62 allowed-ips 192.168.241.2/32,fd00::2/128
[+] NS2: wg set wg0 private-key /dev/fd/63 listen-port 2 peer nkdJlCF8z2+MH7aZV0FN9iO6UM+MUbPebADldwJmNRc= preshared-key /dev/fd/62 allowed-ips 192.168.241.1/32,fd00::1/128
[+] NS1: ip link set up dev wg0
[+] NS2: ip link set up dev wg0
[+] NS1: ip link add veth1 type veth peer name veth2
[+] NS1: ip link set veth2 netns wg-test-32269-2
[+] NS1: ip addr add 10.0.0.1/24 dev veth1
[+] NS1: ip addr add 10.0.0.2/24 dev veth1
[+] NS2: ip addr add 10.0.0.3/24 dev veth2
[+] NS1: ip link set veth1 up
[+] NS2: ip link set veth2 up
[+] NS1: wait for veth1 to come up
[+] NS2: wait for veth2 to come up
[+] NS1: iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
[+] NS2: iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
[+] NS2: wg set wg0 peer nkdJlCF8z2+MH7aZV0FN9iO6UM+MUbPebADldwJmNRc= endpoint 10.0.0.1:1
[+] NS2: ping -W 1 -c 5 -f 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.

--- 192.168.241.1 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 1ms
rtt min/avg/max/mdev = 0.073/0.256/0.915/0.329 ms, ipg/ewma 0.339/0.575 ms
[+] NS2: wg show wg0 endpoints
[+] NS1: conntrack -L
icmp     1 29 src=192.168.241.2 dst=192.168.241.1 type=8 code=0 id=32322 src=192.168.241.1 dst=192.168.241.2 type=0 code=0 id=32322 mark=0 use=1
udp      17 179 src=10.0.0.3 dst=10.0.0.1 sport=2 dport=1 src=10.0.0.1 dst=10.0.0.3 sport=1 dport=2 [ASSURED] mark=0 use=1
conntrack v1.4.4 (conntrack-tools): 2 flow entries have been shown.
[+] NS2: conntrack -L
udp      17 179 src=10.0.0.3 dst=10.0.0.1 sport=2 dport=1 src=10.0.0.1 dst=10.0.0.3 sport=1 dport=2 [ASSURED] mark=0 use=1
icmp     1 29 src=192.168.241.2 dst=192.168.241.1 type=8 code=0 id=32322 src=192.168.241.1 dst=192.168.241.2 type=0 code=0 id=32322 mark=0 use=1
conntrack v1.4.4 (conntrack-tools): 2 flow entries have been shown.
[+] NS2: wg set wg0 peer nkdJlCF8z2+MH7aZV0FN9iO6UM+MUbPebADldwJmNRc= endpoint 10.0.0.2:1
[+] NS2: ping -W 1 -c 5 -f 192.168.241.1
PING 192.168.241.1 (192.168.241.1) 56(84) bytes of data.

--- 192.168.241.1 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.067/0.153/0.320/0.097 ms, ipg/ewma 0.205/0.172 ms
[+] NS2: wg show wg0 endpoints
[+] NS1: conntrack -L
udp      17 179 src=10.0.0.3 dst=10.0.0.2 sport=2 dport=1 src=10.0.0.2 dst=10.0.0.3 sport=1 dport=2 [ASSURED] mark=0 use=1
icmp     1 29 src=192.168.241.2 dst=192.168.241.1 type=8 code=0 id=32327 src=192.168.241.1 dst=192.168.241.2 type=0 code=0 id=32327 mark=0 use=1
icmp     1 29 src=192.168.241.2 dst=192.168.241.1 type=8 code=0 id=32322 src=192.168.241.1 dst=192.168.241.2 type=0 code=0 id=32322 mark=0 use=1
udp      17 179 src=10.0.0.3 dst=10.0.0.1 sport=2 dport=1 src=10.0.0.1 dst=10.0.0.3 sport=1 dport=2 [ASSURED] mark=0 use=1
conntrack v1.4.4 (conntrack-tools): 4 flow entries have been shown.
[+] NS2: conntrack -L
icmp     1 29 src=192.168.241.2 dst=192.168.241.1 type=8 code=0 id=32327 src=192.168.241.1 dst=192.168.241.2 type=0 code=0 id=32327 mark=0 use=1
udp      17 179 src=10.0.0.3 dst=10.0.0.1 sport=2 dport=1 src=10.0.0.1 dst=10.0.0.3 sport=1 dport=2 [ASSURED] mark=0 use=1
icmp     1 29 src=192.168.241.2 dst=192.168.241.1 type=8 code=0 id=32322 src=192.168.241.1 dst=192.168.241.2 type=0 code=0 id=32322 mark=0 use=1
udp      17 179 src=10.0.0.3 dst=10.0.0.2 sport=2 dport=1 src=10.0.0.2 dst=10.0.0.3 sport=1 dport=2 [ASSURED] mark=0 use=1
conntrack v1.4.4 (conntrack-tools): 4 flow entries have been shown.
[+] NS1: ip link del dev wg0
[+] NS2: ip link del dev wg0
[+] ip netns del wg-test-32269-1
[+] ip netns del wg-test-32269-2
