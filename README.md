# Arx Proposals

This repository aims to server as focal point to discuss and to store
enhancement proposals.

## Arx Enhancement Proposal (ArxEP)

**ArxEP** are a formal process whereby important changes are proposed and
discussed. Corresponding to each **ArxEP** there is a document that outlines the
proposed change(s), the discussion around those changes, and motivation for
that change. This document outlines the details of the **ArxEP** process and
corresponding documents.


## What is an ArxEP?

**ArxEP** are heavely based on [SymPEPs](https://github.com/sympy/SymPEPs), the SymPy Enhancement Proposal process. Also, it is inspired by
[PEP](https://www.python.org/dev/peps/) process, used by the Python language
community, and it takes motivations
from other similar processes in communities adjacent to Arx, such as the
[NEP](https://numpy.org/neps/nep-0000.html) process for NumPy and the
[MEP](https://matplotlib.org/devel/MEP/index.html) process for Matplotlib.

However, the **ArxEP** process differs from these processes in many ways, so
those who may already be familiar with similar processes from other
communities should read this document to understand how it works for ArxEPs.

In particular, **ArxEPs** are significantly less formal than Python PEPs.

## Types

There are three kinds of ArxEPs:

A **Standards Track** **ArxEP** describes a new feature or important change for
Arx.

An **Informational** **ArxEP** describes a Arx design issue, or provides general
guidelines or information to the Python community, but does not propose a new
feature. Informational **ArxEPs** do not necessarily represent a Arx community
consensus or recommendation, so users and implementers are free to ignore
Informational **ArxEPs** or follow their advice.

A **Process** **ArxEP** describes a process surrounding Arx, or proposes a
change to (or an event in) a process. Process **ArxEPs** are like Standards Track
ArxEPs but apply to areas other than the Arx library itself. They may
propose an implementation, but not to Arx’s codebase; they require community
consensus. Examples include procedures, guidelines, changes to the
decision-making process, and changes to the tools or environment used in Arx
development. Any meta-ArxEP is also considered a Process ArxEP.

## Purpose

The **ArxEP** process and corresponding documents serve several purposes:

- To decide, as a community, whether a proposed change should be made.
- To decide on the process by which a change will be implemented, for example,
  whether the change should be implemented in several stages, whether
  intermediate releases are required for things like deprecations, and so on.
- To document the above discussions and decisions for future reference.
- To document the motivations for a change from the perspective of end users
  who may be affected by it. Here "end users" means both users of the Arx
  library, as well as developers working on parts of Arx itself which may be
  affected by the change.

Importantly, **an **ArxEP** is not documentation** for the proposed change. End
user documentation should be included with the implementation of the feature
in the corresponding Arx documentation. This also means that other
documentation should not cross-reference an **ArxEP** as if it were documentation
for a feature. Even technical discussion of a feature should be documented
separately from an ArxEP. The reason is that **ArxEPs** will necessarily include
details that are irrelevant to the final implementation, such as discussions
of alternate implementations which were rejected and discussions of
implementation of the change.

## **ArxEP** Workflow

Discussions around a proposed change may begin informally on the mailing list
or Arx issue tracker. However, once it is decided that the formal ArxEP
process is desired for a change, the discussion should move to the
[ArxEP repository](https://github.com/arxlang/arx-design) on GitHub.

Every **ArxEP** must have a champion. This is a person who is responsible for
writing the ArxEP, leads the discussion around it, and tries to create
consensus around it.

The author of an **ArxEP** should fork the repository and create a pull request
with a new **ArxEP** document based on the [ArxEP template](ArxEP-template).
The **ArxEP** document may be named `ArxEP-YYYY-XX.md` until a number is assigned.
One of the core Arx developers will then assign a number to the ArxEP, in
which case `XXXX` should be replaced with the number with leading 0s. The
person who assigns the number should also update the
[README](https://github.com/arxlang/arx-design/blob/main/README.md) of the main
[ArxEP repository](https://github.com/arxlang/arx-design) to list that number.
Numbers should be assigned to **ArxEPs** as soon as it is determined that they
are a legitimate proposal. If an **ArxEP** ends up being rejected or postponed, it
keeps its number, as rejection or postponement status is still a discussion
that should be documented in the ArxEP. **ArxEP** numbers should generally be
assigned in increasing numeric order.

Discussion on the **ArxEP** should then continue on the **ArxEP** pull request.
Discussions may also take place in other places, such as [GitHub
discussions](https://github.com/arxlang/arx-design/discussions) or the [mailing
list](http://groups.google.com/group/Arx). All discussions should be
cross-referenced in the "Discussions" section of the **ArxEP** document.

For each ArxEP, the community should decide whether a draft implementation is
needed before acceptance or not. For instance, if an **ArxEP** concerns the
details of how a feature is implemented, it should be accepted before that
happens. On the other hand, the community may decide that it cannot come to a
consensus about an **ArxEP** until a draft implementation is proposed.

Once the community reaches a consensus about an ArxEP, the status of an ArxEP
should be updated (see below). This consensus may be to accept or to reject
the ArxEP, or to defer it. Here the "community" refers to the broader
community that has a stake in the ArxEP, not just the core Arx developers.
The purpose of the **ArxEP** process is not to create a cabal of decision makers,
but rather to enhance the involvement of the broader Arx community in the
decision making process.

### Status

The **status** section at the top of the **ArxEP** document (see the
[template](ArxEP-template)) should be updated according to the current status
of the ArxEP.

All **ArxEPs** should be created with the **Draft** status. **Draft** status
ArxEPs generally live in a pull request.

Eventually, after discussion, there may be a consensus that the **ArxEP** should
be accepted–see the next section for details. At this point the status
becomes **Accepted**.

Once an **ArxEP** has been **Accepted**, the reference implementation must be
completed. When the reference implementation is complete and incorporated into
the main source code repository, the status will be changed to **Final**.

An **ArxEP** can also be assigned status **Deferred**. The **ArxEP** author or a core
developer can assign the **ArxEP** this status when no progress is being made on
the ArxEP.

An **ArxEP** can also be **Rejected**. Perhaps after all is said and done it was
not a good idea. It is still important to have a record of this fact. The
**Withdrawn** status is similar—it means that the **ArxEP** author themselves has
decided that the **ArxEP** is actually a bad idea, or has accepted that a
competing proposal is a better alternative.

ArxEPs can also be **Superseded** by a different ArxEP, rendering the
original obsolete.

Process **ArxEPs** may also have a status of **Active** if they are never meant
to be completed, e.g. **ArxEP** 1 (this ArxEP).

### Merging the **ArxEP** Document Pull Request

Whenever an **ArxEP** moves from the **Draft** status to one of the other above
statuses, the header should be updated, and the corresponding pull request
should be merged. This way the document lives inside of the **ArxEP** repository
proper. **ArxEPs** that are merged are not set in stone, and may be updated by
future pull requests (although **ArxEPs** that are **Accepted** should generally
not be significantly modified once they have reached that status). The purpose
of merging is simply to make the **ArxEP** visible in the repository, even if it
isn't yet accepted or rejected. **ArxEP** discussions that have stalled should
also be merged, so that the **ArxEP** becomes visible in the **ArxEP** repository
proper—again, discussion may be picked up again with a new pull request.

## Accepting an ArxEP

Once an **ArxEP** is Accepted by consensus of all interested contributors, an
topic should be created to the
[Arx GitHub Discussions](https://github.com/arxlang/arx/discussions)
with a subject like:

    Proposal to accept **ArxEP** #<number>: <title>

In the body of your message, you should:

- link to the latest version of the ArxEP,

- briefly describe any major points of contention and how they were resolved,

- include a sentence like: “If there are no substantive objections within 7
  days from this message, then the **ArxEP** will be accepted; see **ArxEP** 1 for
  more details.”

After you start this discussion, add the GitHub discussion link
to the Discussion section of the ArxEP, so that people can find it later.

Generally, the **ArxEP** author will be the one to start this GH Discussion,
but anyone can do it – the important thing is to make sure that everyone
knows when an **ArxEP** is on the verge of acceptance, and give them a final
chance to respond. If there’s some special reason to extend this final
comment period beyond 7 days, then that’s fine, just say so in the GH Discussion.
It shouldn’t be less than 7 days, because sometimes people are traveling
or similar and need some time to respond.

In general, the goal is to make sure that the community has consensus, not
provide a rigid policy for people to try to game. When in doubt, err on the
side of asking for more feedback and looking for opportunities to compromise.

If the final comment period passes without any substantive objections, then
the **ArxEP** can officially be marked **Accepted**. A followup message should then
be sent to its GH Discussion thread. Update the **ArxEP** by setting its **Status** to
**Accepted**, and its **Resolution** header to a link to your GH Discussion thread.
The **ArxEP** pull request should be merged at this time, if it hasn't been
already, so that it is visible in the **ArxEP** repository proper.

If there are substantive objections, then the **ArxEP** remains in Draft state,
discussion continues as normal, and it can be proposed for acceptance again
later once the objections are resolved.
