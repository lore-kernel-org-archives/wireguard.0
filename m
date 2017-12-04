Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67841597
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 17:24:59 +0000 (UTC)
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
 [209.85.216.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 306edf17
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 17:24:59 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id a16so22783290qtj.3
 for <wireguard@lists.zx2c4.com>; Mon, 04 Dec 2017 09:31:40 -0800 (PST)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: What are the options for stopping and starting?
To: Whit Blauvelt <whit@transpect.com>
References: <20171204160159.GA27666@black.transpect.com>
 <CAHmME9o3+SBZfsWLUczAxKOxmBcWeJYyx_wpGnk_sXNbb8aZgA@mail.gmail.com>
 <20171204172937.GA11936@black.transpect.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <0e21b9be-bb38-427c-629b-a45473d6e223@gmail.com>
Date: Mon, 4 Dec 2017 17:31:35 +0000
MIME-Version: 1.0
In-Reply-To: <20171204172937.GA11936@black.transpect.com>
Content-Type: text/plain; charset=utf-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

On 04/12/17 17:29, Whit Blauvelt wrote:
> Is there a preferred way to take WireGuard fully down? We could
> unload the wireguard (and ip6_udp_tunnel and udp_tunnel?) modules.
> But that seems a crude method. What's perferred? I see we can "set
> <interface> remove", but is there a simple command to take them all
> down? (One could obviously be scripted; just wondering if I'm
> missing that one's already there.)

# ip link del dev wg0

Regards,
Aaron Jones

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJaJYZ0AAoJEIrwc3SIqzASUeEQAJ1E1n6x7ytRQofgyph+FlJe
rRFBhilGwT0t6MPCj44rJTPoGbUWXWZm9EaO+2RXBcpaZpedKpBoyX2kAh92dzYo
TsyHba0uIgSjgZGxxAbDORd2lH0ayIMx+INk0TZFDgAVHLK1e0+rW8DhSwBw3HvY
DZ9q2DqzBZ3Fos1LGxc41u0asFS1tDR4f0lBOvY0m32kXVb/U/2jTJ0VpaaZjlS6
5GwZZQGnfokbE48ge+xydF1CxWhr1/TAF6VqUIGFwBCJL7xYJt3hbVcis2ynraZ+
T5pqlgIEwwIvKvVtUf7OTHm/5qj6zayAlTUdeZnWAcKaCB95+Vuxqdex8Szk832N
B6e3rfJLs8/5BXhKfZ0Pwty8SRzo8KhSVpERSla7p6Ti4eGOFX5rbJzJ4+Hgme+M
KdH4OKoLY3/6+9xjfrzpoFQDkk53Py7B+C2K273Mz206ctziLcGmX1zHD3gKoOZz
CLdKoCrhTUchRfnbWtGH9owyn/JsSwvR/1Slyzoz2U/fbj/MOqiUzoE4F3Cw/3iy
H37OuM2dZzDCxqNx6AQGdXCbFpOhdDAcA2gBPDMMl1uF/cgDhoK+O4oiuFEpXuGQ
4u+mnoLe+WI9PmxRsEgfnqtA1dk/8OT3/YoOSTFdHt0Cunz9F/tC9KA0EmRHzk7Z
O52oPQUlQVRYqnn2wC3y
=RyV9
-----END PGP SIGNATURE-----
