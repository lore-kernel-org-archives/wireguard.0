Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e29dab37
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 14:41:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 349d52e6
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 14:41:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7728d283
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 14:41:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e6ade5e6
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 14:41:13 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id 3so299974287oih.1
 for <wireguard@lists.zx2c4.com>; Mon, 02 Jan 2017 06:49:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qQ495gt_zByeJDA3_x+eKMoVWOjzJypiUQnHVJvq6BWQ@mail.gmail.com>
References: <CAHmME9qQ495gt_zByeJDA3_x+eKMoVWOjzJypiUQnHVJvq6BWQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 2 Jan 2017 15:49:55 +0100
Message-ID: <CAHmME9rNzjRyOGnRk-FJXu_9+OVHXLoH-WTyyeaQgceRdZ+Aww@mail.gmail.com>
Subject: Re: [TOOL] wg-config graduates to src/tools, becomes wg-auto-config
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Jan 2, 2017 at 5:57 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> The re-written `wg-auto-config` script is now a part of src/tools and

I'm not too thrilled about the name. Any suggestions? wg-quick-config?
wg-quickndirty? wg-easy-setup? wg-hamsandwich?

Jason
