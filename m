Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb6b3d0b
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Dec 2016 02:20:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 649b4f7d
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Dec 2016 02:20:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c92a784
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Dec 2016 02:20:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ad1726fc
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Dec 2016 02:20:22 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id 3so255058228oih.1
 for <wireguard@lists.zx2c4.com>; Fri, 30 Dec 2016 18:28:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <e636afa1-7826-47b6-c442-af33d955760e@higgsboson.tk>
References: <A7E34EE0-F8F0-4F88-AA94-58434D0DF2BA@danrl.com>
 <CAHmME9r0tdR8=nnC4yPLJoOE8yU_7iJi0qEpx9POyM3OBZ3otQ@mail.gmail.com>
 <44DAF4D4-00A8-4903-8003-EB0215635B61@danrl.com>
 <CAHmME9qTLVPVrCnrusb3W32EtGYvLuKyyiGz+TWrXTxneVSrCA@mail.gmail.com>
 <7973130b-159b-a7c9-c2d8-24ca7afa8914@mmoya.org>
 <e636afa1-7826-47b6-c442-af33d955760e@higgsboson.tk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 31 Dec 2016 03:28:45 +0100
Message-ID: <CAHmME9rxXHe+G+5oFF2LYGw=dnptdrrGmTEDwjtxBmev3_gNsw@mail.gmail.com>
Subject: Re: [WireGuard] Dual stack?
To: =?UTF-8?Q?J=C3=B6rg_Thalheim?= <joerg@higgsboson.tk>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Dec 29, 2016 at 10:22 AM, J=C3=B6rg Thalheim <joerg@higgsboson.tk> =
wrote:
> On the other hand switching between dual-stack/ipv4 only networks/ipv6 on=
ly networks
> is problematic at the moment with the tools we have for roaming clients,
> because wireguard only supports one endpoint of one address family at the=
 time.
> This might be partially fixable in future by observing the availability o=
f default routes
> in userspace (switch address family if it become unavailable). However th=
e optimal
> solution would be something like the happy eyeballs protocol (https://too=
ls.ietf.org/html/rfc6555),
> which is implemented in modern browser -
> only because somebody got a v6/v4 default route does not mean it is also =
route able.
> I don't know how the latter one would fit into the stateless concept of w=
ireguard.
> I currently help myself by using an dedicated routing protocoll.

Any suggestions on what the right behavior would be to support changes
in a dual stack environment?
