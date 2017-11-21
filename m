Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18270a5c
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 07:49:07 +0000 (UTC)
Received: from smtp21.bhosted.nl (smtp21.bhosted.nl [94.124.121.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0cba52a6
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 07:49:06 +0000 (UTC)
Date: Tue, 21 Nov 2017 07:54:01 +0000
Message-ID: <20171121075401.Horde.gAK_8RJbLyuvqgW8amLTrYK@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: netns.sh stuck at ncat.
References: <20171120231416.Horde.CgDTFw41-BBj-IomMwxyq3_@www.vdorst.com>
 <CAHmME9pFmoZYR2Teh2t+6hjp9HNZcE8o_jvZ17Xvzqmf7bpd6A@mail.gmail.com>
 <CAHmME9r3BDd97=tZZg1kxn_gyQPrdfsdOkLo-Zv=1-rZWDqnHg@mail.gmail.com>
In-Reply-To: <CAHmME9r3BDd97=tZZg1kxn_gyQPrdfsdOkLo-Zv=1-rZWDqnHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Cc: WireGuard list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Quoting "Jason A. Donenfeld" <Jason@zx2c4.com>:

> This is pretty strange looking, and appears like it's a userland issue
> -- like the versions of ncat or ss or whatever weird scripting hacks
> in netns.sh aren't working well with the tools installed or some
> networking sysctl I forgot to toggle... Maybe one quick way of testing
> if it's an ss issue (old RHEL tools, or the like) would be to change
> the function body of waitncatudp into just `sleep 2` or something.

Maybe it did not work before but I didn't noticed because ncat was not  
installed until yesterday.
I tried old wireguard module not the userland tools. But the same  
results stuck at ncat.

This Cubox is running Ubuntu xenial 16.04.3 LTS (GNU/Linux 4.13.14 armv7l)

ncat comes with package nmap

root@cubox-es:~# apt show nmap
Package: nmap
Version: 7.01-2ubuntu2

ss utility, iproute2-ss151103


With sleep 2 it works again.


My script modifications.

root@cubox-es:/usr/src/WireGuard/src/tests# git diff ./netns.sh
diff --git a/src/tests/netns.sh b/src/tests/netns.sh
index 2ad8d88..7718da6 100755
--- a/src/tests/netns.sh
+++ b/src/tests/netns.sh
@@ -38,7 +38,7 @@ ip1() { pretty 1 "ip $*"; ip -n $netns1 "$@"; }
  ip2() { pretty 2 "ip $*"; ip -n $netns2 "$@"; }
  sleep() { read -t "$1" -N 0 || true; }
  waitiperf() { pretty "${1//*-}" "wait for iperf:5201"; while [[ $(ss  
-N "$1" -tlp 'sport = 5201') != *iperf3* ]]; do sleep 0.1; done; }
-waitncatudp() { pretty "${1//*-}" "wait for udp:1111"; while [[ $(ss  
-N "$1" -ulp 'sport = 1111') != *ncat* ]]; do sleep 0.1; done; }
+waitncatudp() { pretty "${1//*-}" "wait for udp:1111"; sleep 2; }
  waitncattcp() { pretty "${1//*-}" "wait for tcp:1111"; while [[ $(ss  
-N "$1" -tlp 'sport = 1111') != *ncat* ]]; do sleep 0.1; done; }
  waitiface() { pretty "${1//*-}" "wait for $2 to come up"; ip netns  
exec "$1" bash -c "while [[ \$(< \"/sys/class/net/$2/operstate\") !=  
up ]]; do read -t .1 -N 0 || true; done;"; }

Greats,

René van Dorst.
