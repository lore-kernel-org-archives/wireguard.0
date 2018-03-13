Return-Path: tim@sedlmeyer.us
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1c83241
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Mar 2018 21:54:22 +0000 (UTC)
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
 [209.85.214.49])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d7edbc5
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Mar 2018 21:54:22 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id w3-v6so2043062itc.4
 for <wireguard@lists.zx2c4.com>; Tue, 13 Mar 2018 15:04:40 -0700 (PDT)
Return-Path: <tim@sedlmeyer.us>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com.
 [209.85.223.170])
 by smtp.gmail.com with ESMTPSA id l66sm564521ioe.39.2018.03.13.15.04.38
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Mar 2018 15:04:38 -0700 (PDT)
Sender: Timothy Sedlmeyer <tim@sedlmeyer.us>
Received: by mail-io0-f170.google.com with SMTP id v6so1937422iog.7
 for <wireguard@lists.zx2c4.com>; Tue, 13 Mar 2018 15:04:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2016b91a-4c7e-db4d-7e22-8a7efc9add39@mailbox.org>
References: <sw07RFheJeAt1YhiYncjYl7au2RKQqmg4fMvgZBN91qBmUxoSGX24JamLXZrSqMC0yvRvz3koe24Li8ini3tEP1h_3j5VF5IFrYwcOMXI0A=@protonmail.com>
 <2016b91a-4c7e-db4d-7e22-8a7efc9add39@mailbox.org>
From: Tim Sedlmeyer <tim@sedlmeyer.org>
Date: Tue, 13 Mar 2018 18:04:37 -0400
Message-ID: <CAK_h9uH4JHMz5j+cZQ4GgO=n0Jqt-R7C+EQFGR5FXciCzV0qcA@mail.gmail.com>
Subject: Re: Multiple peers
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Another option instead of using the iptables rule is to create a
network namespace
and assign the wireguard interface to it.

ip netns add mesh
ip link add wg0 type wireguard
ip link set wg0 netns mesh
ip -n mesh addr add x.x.x.x/24 dev wg0
ip netns exec mesh wg setconf wg0 /etc/wireguard/wg0.conf
ip -n mesh link set wg0 up

I prefer this because it isolates any mesh network routing and firewall
configuration from that of the physical interfaces of the hub server.
You don't have to
worry about a routing or firewall misconfiguration on the hub leading
to the traffic from
the vpn network going on to the hub server's underlying network.

Also if you want to provide a service to the VPN network from the
server you can run
the process in the mesh network namespace or inside a container with
only an interface
in the mesh namespace available to it.

On Tue, Mar 13, 2018 at 1:35 PM,
<condor+wireguard-mailinglist@mailbox.org> wrote:
> Hi Gianluca,
>
>> I wonder if I need to copy/paste all peers' public key on all the other
>> peers' configuration, or I can just configure each peer to connect to th=
e
>> server and then allow peers talking with other peers passing through thi=
s
>> server?
>
> If you want each peer to have a 1:1 connection to each other peer, then =
=E2=80=93
> yes. But to maintain such a mesh will be quite a bit of work=E2=80=A6
>
> The easier solution should be to use the server as a hub. Make sure the
> AllowedIPs on the =E2=80=9Cclients=E2=80=9D permit the subnet IP range yo=
u will be using,
> e.g. 192.168.10.0/24. The =E2=80=9Cserver's=E2=80=9D setting for AllowedI=
Ps for each peer
> should reflect the single address (/32) you are setting as interface addr=
ess
> on the peer's side.
>
> To glue, add an iptables rule:
> iptables -A FORWARD -i wg9 -o wg9 -j ACCEPT
>
>
> Kind regards,
> Peter
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
