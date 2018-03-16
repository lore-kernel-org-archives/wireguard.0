Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c746023
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 10:43:08 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [91.121.86.59])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87ae44a7
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 10:43:07 +0000 (UTC)
Date: Fri, 16 Mar 2018 15:53:43 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Matthias Ordner <matthias.ordner@noris.net>, Kalin KOZHUHAROV
 <me.kalin@gmail.com>
Subject: Re: Mixed MTU hosts on a network
Message-ID: <20180316155343.09a0f1bc@natsu>
In-Reply-To: <f8af81d0-631c-b74b-9491-94db61a250a2@noris.net>
References: <20180316142547.2ecb70de@natsu>
 <f8af81d0-631c-b74b-9491-94db61a250a2@noris.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/2h/uAF8/MjxibCJ6LbIqMxw"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--MP_/2h/uAF8/MjxibCJ6LbIqMxw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, 16 Mar 2018 10:35:18 +0100
Matthias Ordner <matthias.ordner@noris.net> wrote:

> If you only care about TCP connections you could set a different TCP-MSS 
> with an iptables rule.

On Fri, 16 Mar 2018 11:01:51 +0100
Kalin KOZHUHAROV <me.kalin@gmail.com> wrote:

> You may need to pre-shape the packets for the "offenders", e.g.
> 
> ip6tables -t mangle -A POSTROUTING -o wg0 -d WHATEVERHOST -p tcp -m
> tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss 1352
> 
> https://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO-4.html#ss4.7
> 
> O, wait! You talk IPv6...
> 
> ip6tables -t mangle -A POSTROUTING -o wg0 -d fd39:30::250/128 -p tcp
> -m tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss 1372

I knew about this option, but wanted to avoid it because it would incur more
overhead (going to iptables for this) and a bit more complexity.

But guess what, turns out that didn't work either. Tried both OUTPUT and
POSTROUTING chains on the "mangle" table, and set-mss all the way down to
1220, no matter what, the iperf3 output looked the same as before. At this
point I thought I'm going crazy or something. :)

It's not just iperf either, trying to send a file with "netcat6" into a
running listener on the other side also failed to transfer data.

Then almost by accident, I discovered that what also helps. It's to reduce
interface MTU only on the receiver, but just by a bit more, to 1408.

So what makes it work is EITHER:

a) set MTU 1412 on wg0 at sender;

OR

b) set MTU 1408 on wg0 at receiver.

...doing both at the same time is not even necessary. Some tcpdumps from the
receiver host are attached to demonstrate (if anyone else thinks I am crazy :).

Now, I can live with just the impacted (PPPoE) hosts having a lower MTU on wg0.

But still the whole thing seems rather weird.

-- 
With respect,
Roman

--MP_/2h/uAF8/MjxibCJ6LbIqMxw
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=mtu-tcpdump.txt

Receiver mtu 1420, sender mtu 1412, successful transfer:

# tcpdump -i wg0
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on wg0, link-type RAW (Raw IP), capture size 262144 bytes
15:42:35.027995 IP6 fd39:30::2.42414 > fd39:30::250.5001: Flags [S], seq 4148302601, win 27040, options [mss 1352,sackOK,TS val 2239613851 ecr 0,nop,wscale 9], length 0
15:42:35.028026 IP6 fd39:30::250.5001 > fd39:30::2.42414: Flags [S.], seq 505975510, ack 4148302602, win 26960, options [mss 1360,sackOK,TS val 1473426057 ecr 2239613851,nop,wscale 9], length 0
15:42:35.102517 IP6 fd39:30::2.42414 > fd39:30::250.5001: Flags [.], ack 1, win 53, options [nop,nop,TS val 2239613925 ecr 1473426057], length 0
15:42:35.102772 IP6 fd39:30::2.42414 > fd39:30::250.5001: Flags [.], seq 1:1341, ack 1, win 53, options [nop,nop,TS val 2239613925 ecr 1473426057], length 1340
15:42:35.102785 IP6 fd39:30::250.5001 > fd39:30::2.42414: Flags [.], ack 1341, win 58, options [nop,nop,TS val 1473426131 ecr 2239613925], length 0
15:42:35.102810 IP6 fd39:30::2.42414 > fd39:30::250.5001: Flags [P.], seq 1341:2145, ack 1, win 53, options [nop,nop,TS val 2239613925 ecr 1473426057], length 804
15:42:35.102818 IP6 fd39:30::250.5001 > fd39:30::2.42414: Flags [.], ack 2145, win 64, options [nop,nop,TS val 1473426131 ecr 2239613925], length 0
15:42:35.729846 IP6 fd39:30::250.5001 > fd39:30::2.42162: Flags [F.], seq 1811803733, ack 3749581328, win 56, options [nop,nop,TS val 1473426758 ecr 2239251660,nop,nop,sack 1 {1341:2145}], length 0
15:42:35.804023 IP6 fd39:30::2.42162 > fd39:30::250.5001: Flags [.], ack 1, win 54, options [nop,nop,TS val 2239614627 ecr 1473426758,nop,nop,sack 1 {0:1}], length 0
15:42:36.939584 IP6 fd39:30::2.42414 > fd39:30::250.5001: Flags [F.], seq 2145, ack 1, win 53, options [nop,nop,TS val 2239615763 ecr 1473426131], length 0
15:42:36.939723 IP6 fd39:30::250.5001 > fd39:30::2.42414: Flags [F.], seq 1, ack 2146, win 64, options [nop,nop,TS val 1473427968 ecr 2239615763], length 0
15:42:37.014143 IP6 fd39:30::2.42414 > fd39:30::250.5001: Flags [.], ack 2, win 53, options [nop,nop,TS val 2239615837 ecr 1473427968], length 0
^C
12 packets captured
12 packets received by filter
0 packets dropped by kernel

=======================================================

Receiver mtu 1408, sender mtu 1420, successful transfer:

# tcpdump -i wg0
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on wg0, link-type RAW (Raw IP), capture size 262144 bytes
15:43:23.935508 IP6 fd39:30::2.42442 > fd39:30::250.5001: Flags [S], seq 1011924297, win 27200, options [mss 1360,sackOK,TS val 2239662759 ecr 0,nop,wscale 9], length 0
15:43:23.935541 IP6 fd39:30::250.5001 > fd39:30::2.42442: Flags [S.], seq 1735470303, ack 1011924298, win 26720, options [mss 1348,sackOK,TS val 1473474964 ecr 2239662759,nop,wscale 9], length 0
15:43:24.009867 IP6 fd39:30::2.42442 > fd39:30::250.5001: Flags [.], ack 1, win 54, options [nop,nop,TS val 2239662834 ecr 1473474964], length 0
15:43:24.010192 IP6 fd39:30::2.42442 > fd39:30::250.5001: Flags [.], seq 1:1337, ack 1, win 54, options [nop,nop,TS val 2239662834 ecr 1473474964], length 1336
15:43:24.010203 IP6 fd39:30::250.5001 > fd39:30::2.42442: Flags [.], ack 1337, win 58, options [nop,nop,TS val 1473475039 ecr 2239662834], length 0
15:43:24.010206 IP6 fd39:30::2.42442 > fd39:30::250.5001: Flags [P.], seq 1337:2145, ack 1, win 54, options [nop,nop,TS val 2239662834 ecr 1473474964], length 808
15:43:24.010213 IP6 fd39:30::250.5001 > fd39:30::2.42442: Flags [.], ack 2145, win 63, options [nop,nop,TS val 1473475039 ecr 2239662834], length 0
15:43:26.669491 IP6 fd39:30::2.42442 > fd39:30::250.5001: Flags [F.], seq 2145, ack 1, win 54, options [nop,nop,TS val 2239665493 ecr 1473475039], length 0
15:43:26.669531 IP6 fd39:30::250.5001 > fd39:30::2.42442: Flags [F.], seq 1, ack 2146, win 63, options [nop,nop,TS val 1473477698 ecr 2239665493], length 0
15:43:26.744246 IP6 fd39:30::2.42442 > fd39:30::250.5001: Flags [.], ack 2, win 54, options [nop,nop,TS val 2239665568 ecr 1473477698], length 0
^C
10 packets captured
10 packets received by filter
0 packets dropped by kernel

=======================================================

Receiver mtu 1412, sender mtu 1420, locked-up transfer:

# tcpdump -i wg0
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on wg0, link-type RAW (Raw IP), capture size 262144 bytes
15:44:47.350436 IP6 fd39:30::2.42536 > fd39:30::250.5001: Flags [S], seq 1322713189, win 27200, options [mss 1360,sackOK,TS val 2239746176 ecr 0,nop,wscale 9], length 0
15:44:47.350510 IP6 fd39:30::250.5001 > fd39:30::2.42536: Flags [S.], seq 167242985, ack 1322713190, win 26800, options [mss 1352,sackOK,TS val 1473558379 ecr 2239746176,nop,wscale 9], length 0
15:44:47.424806 IP6 fd39:30::2.42536 > fd39:30::250.5001: Flags [.], ack 1, win 54, options [nop,nop,TS val 2239746250 ecr 1473558379], length 0
15:44:47.425210 IP6 fd39:30::2.42536 > fd39:30::250.5001: Flags [P.], seq 1341:2145, ack 1, win 54, options [nop,nop,TS val 2239746250 ecr 1473558379], length 804
15:44:47.425231 IP6 fd39:30::250.5001 > fd39:30::2.42536: Flags [.], ack 1, win 56, options [nop,nop,TS val 1473558454 ecr 2239746250,nop,nop,sack 1 {1341:2145}], length 0
15:44:51.199602 IP6 fd39:30::2.42536 > fd39:30::250.5001: Flags [F.], seq 2145, ack 1, win 54, options [nop,nop,TS val 2239750025 ecr 1473558454], length 0
15:44:51.199627 IP6 fd39:30::250.5001 > fd39:30::2.42536: Flags [.], ack 1, win 56, options [nop,nop,TS val 1473562228 ecr 2239746250,nop,nop,sack 1 {1341:2146}], length 0
^C
7 packets captured
7 packets received by filter
0 packets dropped by kernel


--MP_/2h/uAF8/MjxibCJ6LbIqMxw--
