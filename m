Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64bdef25
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 17:48:23 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f93556ca
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 17:48:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d7953e7
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 17:48:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1d7beaca
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 17:48:23 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id 103so3365037otj.12
 for <wireguard@lists.zx2c4.com>; Mon, 04 Dec 2017 09:55:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <34ce36c3-38fe-96fe-4b2d-22a819272a8d@zandbergen.org>
References: <b984758b-93ce-f909-e63e-f31fb575a5f9@gmail.com>
 <CAHmME9qFWDme113eRkxtK4ut9tK1i3auWT_YrCsZwrUdZAiJHw@mail.gmail.com>
 <34ce36c3-38fe-96fe-4b2d-22a819272a8d@zandbergen.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 4 Dec 2017 18:55:02 +0100
Message-ID: <CAHmME9ouCkbigR=5TCMPQBoNp-uT8PhmjHBiTs2XbmyJo0CSfA@mail.gmail.com>
Subject: Re: Wireguard ceased to work after Fedora 26->27 upgrade
To: Pim Zandbergen <pim@zandbergen.org>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Dec 4, 2017 at 6:54 PM, Pim Zandbergen <pim@zandbergen.org> wrote:
> I was just about to upgrade my f26 router when I read  about this issue.
> As a test, I installed wireguard on a f27 host from scratch. It just worked.
> So I suppose, removing before upgrade and installing afterwards should avoid
> Germano's issue.

Might be worth reporting to Fedora that dkms breaks on release upgrades.
