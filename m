Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b0b9913
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Aug 2016 14:51:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d45a3b7a
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Aug 2016 14:51:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0ebd5b23
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Aug 2016 14:51:53 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f65so200929028wmi.0
 for <wireguard@lists.zx2c4.com>; Wed, 17 Aug 2016 07:57:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1471445090.61594.362.camel@infradead.org>
References: <919f5c60-4f1e-0f12-012b-021bce9aca5d@solidadmin.com>
 <CAHmME9oA9CeFr30WJwkEgamrFJrWX-rT3-NSsDLwcyybM7JbMw@mail.gmail.com>
 <1471445090.61594.362.camel@infradead.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Aug 2016 16:57:08 +0200
Message-ID: <CAHmME9pFbL1xA6bKn1+8uyM-b+LEWt64bTFZKqP0D3p4uVrY6w@mail.gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Fedora WireGuard RPMs
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Aug 17, 2016 at 4:44 PM, David Woodhouse <dwmw2@infradead.org> wrote:
>
> The BR should also be for 'pkgconfig(libmnl)', not 'libmnl-devel',
> shouldn't it?
>
> Unless WireGuard isn't actually using pkgconfig to find the library?
> In which case WireGuard should be fixed and *then* the BR should be for
> 'pkgconfig(libmnl)' :)

WireGuard is using pkgconfig. David is right about pkgconfig(libmnl).
