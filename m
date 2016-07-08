Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id d4ac6007
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 19:55:45 +0000 (UTC)
Date: Fri, 8 Jul 2016 14:55:07 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160708195507.GA1990@wolff.to>
References: <278721635a23c243@frisell.zx2c4.com>
 <20160708162337.GA5566@wolff.to>
 <CAHmME9r4WXY3_OM5O9jH5QONDaaGyKA08ypwQw+d=gBnn2BwuQ@mail.gmail.com>
 <CAHmME9o0RrpbUBB7nBQ319d_0pragpf94jFX0ZCGdMX9W8T1ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9o0RrpbUBB7nBQ319d_0pragpf94jFX0ZCGdMX9W8T1ug@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [ANNOUNCE] Snapshot `experimental-0.0.20160708.1`
 Available
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Jul 08, 2016 at 20:49:07 +0200,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>On Fri, Jul 8, 2016 at 7:55 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>> But is it too fragile? Maybe we should scrap all of this and make
>> persistent keepalives authenticated. I'm not too thrilled about that
>> though...
>
>I'm experimenting with this in the authenticated-persistent-keepalive
>branch, if you'd like to try it out and report back on how it goes...

It looks like initially it does 0 length udp packets for keep alive and the 
authenticated keep alives don't seem to happen until after some data is sent.
