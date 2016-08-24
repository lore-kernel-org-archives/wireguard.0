Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6af8281
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Aug 2016 22:45:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad6a80a9
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Aug 2016 22:45:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 07d83315
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Aug 2016 22:45:09 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id l89so22405925lfi.1
 for <wireguard@lists.zx2c4.com>; Wed, 24 Aug 2016 15:51:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9oHC47++nLGkFXjtoRgAkoOVfE_4EgQXiBsXmqsq1kTXQ@mail.gmail.com>
References: <CAHmME9oHC47++nLGkFXjtoRgAkoOVfE_4EgQXiBsXmqsq1kTXQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 25 Aug 2016 00:51:19 +0200
Message-ID: <CAHmME9rUNtW9Swj-MHhjhVJh78UXPZP4aWzrr2HV1x0dtgUYdA@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Subject: Re: [WireGuard] Session Key Extraction & Request for Dissector
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Aug 25, 2016 at 12:40 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> The first value is the index, which should...

Small improvement:

# ./extract-keys wg0
0xe25d9516 IHHXzJVLOm2fw6J4dGsVDNUH4l6plYw70b0IozmH8KQ=
0xd29e7538 D7ZiiRXaVA+UXNT3FBoAiKCu+3eSrp/fHCz0KisxaVk=
0x90c99abb EI33BYVaI0rziFUxvLBsVM8z6glhW7tLWR7+MTAe43s=
0x9540a866 yAjjnONW6TGrZm/tdrg7KIAZ2ipxn/YqWSba4lh377U=

The first field is the index. The second field is the key. If you see
a packet with the index, decrypt it with the key. Plain and simple.
This actually amounts to printing out:

    REMOTE_KEY_ID SENDING_KEY
    LOCAL_KEY_ID RECEIVING_KEY

But from the point of view of a dissector it doesn't really matter.
See a packet, match the index, decrypt the payload.
