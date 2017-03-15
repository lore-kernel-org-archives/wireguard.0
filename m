Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd2e8946
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Mar 2017 16:31:13 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a18fad4e
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Mar 2017 16:31:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cd38310
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Mar 2017 16:31:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 50f37a2c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Mar 2017 16:31:12 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id 19so24907659oti.0
 for <wireguard@lists.zx2c4.com>; Wed, 15 Mar 2017 09:34:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <15acfffc263.e11103bb85901.2506936173902453879@mysterious.site>
References: <15acfffc263.e11103bb85901.2506936173902453879@mysterious.site>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 15 Mar 2017 09:34:45 -0700
Message-ID: <CAHmME9p8kMshYw0A0v7ibY_jeNbMDLX5TE1+r0e02j+28kk8Dg@mail.gmail.com>
Subject: Re: Some questions about the protocol
To: sopium <sopium@mysterious.site>
Content-Type: text/plain; charset=UTF-8
Cc: wireguard <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey,

Good questions.

Firstly, I've augmented the timers section on wireguard.io/protocol/ a
little bit, and I'll continue adding detail to this.

Secondly, I hope work is coming along nicely with you and Sascha for
merging your efforts. With Sascha's approval, I can set you up with
commit access to wireguard-rs, if you'd like.

Now, onto your questions:


On Tue, Mar 14, 2017 at 8:25 PM, sopium <sopium@mysterious.site> wrote:
> * Do we send cookie reply messages in response to handshake
>   _response_ messages? My guess is YES? The figure in 5.4.1 only
>   shows the case that the responder chooses to reply with a
>   cookie message.

Yes. Cookie reply messages are sent when:
- mac1 is valid; and
- mac2 is invalid; and
- the machine is under load
This applies to all messages that have mac1&&mac2, which means both
the handshake initiation and handshake response messages.

> * Shall we start handshake in case the _previous_ session is not
>   alive, or too old? My guess is NO?

I'm not sure I understand your question. Could you rephrase? Here's
some text that might clarify things possibly:

- A handshake initiation is retried after REKEY_TIMEOUT ms, if a
response has not been received.
- If we have sent a packet to a given peer but have not received a
packet (or a keepalive) after from that peer for (KEEPALIVE +
REKEY_TIMEOUT) ms, we initiate a new handshake.
- After sending a packet, if the number of packets sent using that key
exceed REKEY_AFTER_MESSAGES, we initiate a new handshake.
- After sending a packet, if the sender was the original initiator of
the handshake and if the current session key is REKEY_AFTER_TIME ms
old, we initiate a new handshake. If the sender was the original
responder of the handshake, it does not reinitiate a new handshake
after REKEY_AFTER_TIME ms like the original initiator does.
- After a handshake is completed, with a message from initiator to
responder and then responder back to initiator, the initiator may then
send encrypted session packets, but the responder cannot. The
responder must wait to use the new session until it has recieved one
encrypted session packet from the initiator, in order to provide key
confirmation. Thus, until the responder receives that first packet
using the newly established session, it must either queue up packets
to be sent later, or use the previous session, if one exists and is
valid. Therefore, after the initiator receives the response from the
responder, if it has no data packets immediately queued up to send, it
should send en empty packet, so as to provide this confirmation.

> * When padding packets, how to avoid getting larger than MTU,
>   because we don't seem to know the MTU?

You know the MTU of the WireGuard interface, and so you pad packets to
fit into that. You can query this from the TUN device.

WireGuard currently doesn't do per-peer-endpoint PMTU, but I'm working
on this, and I'll update you when this is worked out.

> * When we receive a valid handshake init message, a secure
>   transport is session is created. Do we start sending with this
>   session immediately, in case there is still a valid previous
>   session? Because if the handshake response we send is lost, the
>   peer won't be able to decrypt our transport messages. The
>   problem should eventually go away, but the peer may experience
>   a brief blackout.

The initiator begins using the newly created session immediately after
receiving the response from the responder.
The responder keeps using the previously created session, until it has
received the first encrypted message from the initiator, at which
point it starts using the new session. This is to ensure "key
confirmation" and also has the nice effect of avoiding race conditions
and blackouts.
In total, you need to have "previous session", "current session", and
"next session", and cycle these as needed.

In case that explanation above isn't clear:
add_new_keypair is called immediately after computing the session keys
(the combination of initiation message + response message):
https://git.zx2c4.com/WireGuard/tree/src/noise.c#n122
noise_received_with_keypair is called whenever a symmetrically
encrypted&authenticated packet is received.

>   So, shall we wait until successfully receiving a transport
>   message with the new session, before start sending with
>   it? (When the previous session is still valid, of course.)

Yes.

>
> * And, do we set peer endpoint when receiving an authenticated
>   cookie reply message? No?

Your intuition is correct: no, you shouldn't do this.

Great questions. Let me know if you have more, or if it'd be helpful
to talk through this stuff on video chat or telephone instead of
email.

Regards,
Jason
