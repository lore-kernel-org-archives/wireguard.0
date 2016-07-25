Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e09f540e
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jul 2016 12:55:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62abed2c
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jul 2016 12:55:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dc0fc9a2
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jul 2016 12:55:34 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id f93so127982768lfi.2
 for <wireguard@lists.zx2c4.com>; Mon, 25 Jul 2016 05:57:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160723172553.GA6236@wolff.to>
References: <20160721205742.GA10312@wolff.to>
 <20160722081821.GA11505@lud.polynome.dn42>
 <20160722090913.GA8383@wolff.to> <20160722093211.GA12311@lud.polynome.dn42>
 <20160722113212.GA17578@wolff.to>
 <CAHmME9rX828zTOjCvcHAQgNxofmDxU0WpZcgqPTTMX2v-ZKmgA@mail.gmail.com>
 <20160722151458.GA14212@wolff.to>
 <CAHmME9oDAbN=OW8oLERFJQUnhKua_dSvSBVKz9139ORhEWOU8g@mail.gmail.com>
 <20160722180527.GA14911@wolff.to> <20160723163637.GA3426@wolff.to>
 <20160723172553.GA6236@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 25 Jul 2016 14:57:56 +0200
Message-ID: <CAHmME9rbAOpSWK1xRqGHe7jF2cBFg6_nKCY-0E17ERU60t2UAw@mail.gmail.com>
To: Bruno Wolff III <bruno@wolff.to>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Using wireguard link as a proxy?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Bruno,

Jeeze louise. Seems woefully complex. Inspired by your attempts here,
I thought of another method involving network namespaces that you
might consider instead. Voila: https://www.wireguard.io/netns/

Jason
