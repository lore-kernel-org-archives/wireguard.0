Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4fcdf749
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jul 2016 11:58:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e42692b
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jul 2016 11:58:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 61f91913
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jul 2016 11:58:38 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id l69so47836466lfg.1
 for <wireguard@lists.zx2c4.com>; Thu, 28 Jul 2016 05:01:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHQn_MD74m-mHQLCbK7UG72BnCdbVbdUpiD0jF4Jk1NFuJMLAw@mail.gmail.com>
References: <CAHQn_MD74m-mHQLCbK7UG72BnCdbVbdUpiD0jF4Jk1NFuJMLAw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 28 Jul 2016 14:01:23 +0200
Message-ID: <CAHmME9qF=jWLXfoO0Y7Vt04SyqvYUKEgr-JhG1iMC=oc84=FCg@mail.gmail.com>
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

Hi Bin,

I think I'll just get rid of it completely in `show` but not in the
more explicit views. So,

  - # wg show wg0  -- no private key
  - # wg show wg0 private-key -- yes private key
  - # wg showconf wg0 -- yes private key

What would you think of this?

Regards,
Jason
