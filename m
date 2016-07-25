Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f0721a7
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jul 2016 10:04:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53a05629
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jul 2016 10:04:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b5c12c7b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jul 2016 10:04:44 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id g62so124854069lfe.3
 for <wireguard@lists.zx2c4.com>; Mon, 25 Jul 2016 03:07:08 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 25 Jul 2016 12:07:06 +0200
Message-ID: <CAHmME9o2zJUNcQ3sx5Ff5JhYYzJRgw_jnJVtZyhE_4m_DHyJow@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Subject: [WireGuard] Using Network Namespaces for Default Routing
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey guys,

I had a small idea over the weekend of using network namespaces with
wireguard for controlling the default route, as a substitute for
0/1,128/1 or rule-based routing. I collected my thoughts on this here:
https://www.wireguard.io/netns/ with the relevant part in this section
https://www.wireguard.io/netns/#the-new-namespace-solution .

The basic gist is as follows:

# ip netns create physical
# ip link set eth0 netns physical
# iw phy phy0 set netns name physical
# ip -n physical link add wg0 type wireguard
# ip -n physical set wg0 netns 1
# ip netns exec physical dhcpcd wlan0
# ip netns exec physical wpa_supplicant -iwlan0
-c/etc/wpa_supplicant/wpa_supplicant.conf
# ip -n physical addr add 192.168.12.52/24 dev eth0
# wg setconf wg0 /etc/wireguard/wg0.conf
# ip addr add 10.2.4.5/32 dev wg0
# ip route add default dev wg0
# ip link set wg0 up

But there's a lot more detail on the page listed above. Interested in
hearing your feedback!

Regards,
Jason
