Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2c0b9d9
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 18:08:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9156a1b
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 18:08:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ca456a78
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 18:08:29 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id l188so159764922lfe.2
 for <wireguard@lists.zx2c4.com>; Wed, 06 Jul 2016 11:08:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+1cUOJpc_niQem-v8dLciMb8JQiQ0VGxaCdhmJGjiyw4bqWTw@mail.gmail.com>
References: <1467669091.3196.0@smtp.gmail.com>
 <CAHmME9rBTuQ7d3qmbzx3J47NUF7xNXMP5tO8o3UU5G7AiGM=JQ@mail.gmail.com>
 <1467672361.2339.0@smtp.gmail.com> <1467672796.2967.0@smtp.gmail.com>
 <CAHmME9rKcz4TX1LizTr1pQvLxUeFP7ijS0BpiY4biRtimWTMbA@mail.gmail.com>
 <CAHmME9r7QKWwbKAo-9OXcLV4Ywv6C8NtvAHrhKM4Z8W2LxZ5dA@mail.gmail.com>
 <CA+1cUOJLSz3HnOo6UxeO8cuTmagpf=uuAh9_AX4VAVuD58BruQ@mail.gmail.com>
 <CAHmME9oF-5QHras_G26Q8q5R1BuncCrJ15knMbsosgS+tKrQiA@mail.gmail.com>
 <CA+1cUOJpc_niQem-v8dLciMb8JQiQ0VGxaCdhmJGjiyw4bqWTw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 6 Jul 2016 20:08:33 +0200
Message-ID: <CAHmME9rTKw2AiLqvDTYoxYsk_kBCP7XUu4WOsWVop-kWrem_Bw@mail.gmail.com>
To: Artyom Aleksyuk <artyom.h31@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Can WireGuard be adopted for older kernels?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Artyom,

It looks like you were the victim of a horrible bug after all:
https://bugzilla.gnome.org/review?bug=768419&attachment=330932

Welcome back to the list.

Jason
