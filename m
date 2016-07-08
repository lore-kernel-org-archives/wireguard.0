Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id d6fd58ed
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 20:55:30 +0000 (UTC)
Date: Fri, 8 Jul 2016 15:54:51 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160708205451.GA5959@wolff.to>
References: <278721635a23c243@frisell.zx2c4.com>
 <20160708162337.GA5566@wolff.to>
 <CAHmME9r4WXY3_OM5O9jH5QONDaaGyKA08ypwQw+d=gBnn2BwuQ@mail.gmail.com>
 <CAHmME9o0RrpbUBB7nBQ319d_0pragpf94jFX0ZCGdMX9W8T1ug@mail.gmail.com>
 <20160708195507.GA1990@wolff.to>
 <CAHmME9ogt0izYi9_+3DqdEZAofLRE98fXdo1u7B581B0MknYUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9ogt0izYi9_+3DqdEZAofLRE98fXdo1u7B581B0MknYUw@mail.gmail.com>
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

On Fri, Jul 08, 2016 at 22:21:09 +0200,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>On Fri, Jul 8, 2016 at 9:55 PM, Bruno Wolff III <bruno@wolff.to> wrote:
>> It looks like initially it does 0 length udp packets for keep alive and the
>> authenticated keep alives don't seem to happen until after some data is
>> sent.
>
>I suspect you forgot to rmmod the previous module before trying this
>branch. There are no 0 length udp packets sent anywhere in this
>branch's code paths.

Yep, that was it. It allowed a remote connection at start up without 
having to manually send traffic out locally first. So it looks like 
it is working as expected.

Right now I am testing through a stateful firewall that blocks the 
inbound connection unless it is related to an already established 
connection. That isn't exactly the same as nat, but should work similarly 
for testing purposes.
