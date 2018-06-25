Return-Path: adrian.sev@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb6bbae3
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jun 2018 19:55:12 +0000 (UTC)
Received: from mail-wm0-x22a.google.com (mail-wm0-x22a.google.com
 [IPv6:2a00:1450:400c:c09::22a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8982ef98
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jun 2018 19:55:12 +0000 (UTC)
Received: by mail-wm0-x22a.google.com with SMTP id 69-v6so11282380wmf.3
 for <wireguard@lists.zx2c4.com>; Mon, 25 Jun 2018 13:00:38 -0700 (PDT)
Return-Path: <adrian.sev@gmail.com>
Subject: Re: wg addconf :: AllowedIPs gets deleted with the additions of peers
To: =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <a989a217-9e18-5e5f-2a97-fa3ac81ccb87@gmail.com>
 <8736xaod3b.fsf@toke.dk>
From: Adrian Sevcenco <adrian.sev@gmail.com>
Message-ID: <ff54875a-3630-52bd-5f45-1b8e8a182ae7@gmail.com>
Date: Mon, 25 Jun 2018 23:00:36 +0300
MIME-Version: 1.0
In-Reply-To: <8736xaod3b.fsf@toke.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 06/25/2018 10:55 PM, Toke H=C3=B8iland-J=C3=B8rgensen wrote:
> Adrian Sevcenco <adrian.sev@gmail.com> writes:
>=20
>> Hi! It seems that AllowedIPs declaration gets erased when peers are
>> added with addconf
>=20
> You can't have the same AllowedIPs for two different peers... :)
Err... so, it's a bug or a feature?
If it is a feature how can i make server accept whatever ip get the=20
client(s) in various networks?

Thank you!
Adrian
