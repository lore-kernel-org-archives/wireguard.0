Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 133f79d6
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Jul 2016 14:44:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29eb9fc8
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Jul 2016 14:44:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 856797cf
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Jul 2016 14:44:10 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id l69so76690356lfg.1
 for <wireguard@lists.zx2c4.com>; Mon, 18 Jul 2016 07:45:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMRLKH_CB2oKmYnyBX3ntyqyLHUCZh_m5Wk-bWdYd_tkm-FxGA@mail.gmail.com>
References: <CAMRLKH_CB2oKmYnyBX3ntyqyLHUCZh_m5Wk-bWdYd_tkm-FxGA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 18 Jul 2016 16:45:40 +0200
Message-ID: <CAHmME9rR586Z-ijdgDLbJj3HCckTkP+NV=MeHVSemOW+AL9TkA@mail.gmail.com>
To: Quan Zhou <quanzhou822@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] 0.0.0.0/0 in AllowedIPs for multiple peer on the
	same interface.
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

You cannot have 0/0 for multiple peers. Otherwise, how will WireGuard
know where to send traffic?
