Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd4f7235
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jul 2016 15:17:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7913945
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jul 2016 15:17:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d251521b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jul 2016 15:17:04 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id l69so51986753lfg.1
 for <wireguard@lists.zx2c4.com>; Thu, 28 Jul 2016 08:19:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHQn_MAQUR4x5Tn0bRNi1yrnhjihxCRO7pGiJe56ONwiTS8CXA@mail.gmail.com>
References: <CAHQn_MD74m-mHQLCbK7UG72BnCdbVbdUpiD0jF4Jk1NFuJMLAw@mail.gmail.com>
 <CAHmME9qF=jWLXfoO0Y7Vt04SyqvYUKEgr-JhG1iMC=oc84=FCg@mail.gmail.com>
 <CAHQn_MAQUR4x5Tn0bRNi1yrnhjihxCRO7pGiJe56ONwiTS8CXA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 28 Jul 2016 17:19:49 +0200
Message-ID: <CAHmME9orEwEfg_ohUriOngHczQ3VZAdAMya2=-obTSA4EHTkiQ@mail.gmail.com>
To: Bin Jin <bjin@ctrl-d.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Suggestion: Hide private key by default with wg tool
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

https://git.zx2c4.com/WireGuard/commit/?id=ded0e645cfa45130e42c4d5bfba8f7d54e1855a9

Set WG_HIDE_KEYS=never to see the keys. Otherwise they're hidden.
